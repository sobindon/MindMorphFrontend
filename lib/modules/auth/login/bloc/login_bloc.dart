import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../data/repositories/login_repository.dart';
import '../models/login_request_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(LoginLoading());
      await _onLoginRequested(event, emit);
    });
  }

  Future<void> _onLoginRequested(
      LoginRequested event, Emitter<LoginState> emit) async {
    try {
      final email = event.email;
      final password = event.password;

      final user = LoginRequestModel(email: email, password: password);
      final response = await loginRepository(user);

      if (response.status == 200) {
        emit(LoginSuccess(response.message));
        return;
      }

      if (response.status != 200) {
        emit(LoginFailure(response.message));
        return;
      }

      // print('PAssword: $password');
      // if (password.length < 5) {
      //   return emit(LoginFailure('Password must be at least 6 characters'));
      // }

      // await Future.delayed(const Duration(seconds: 4), () {
      //   return emit(
      //     LoginSuccess(id: 1, fullName: 'Narayan Gautam'),
      //   );
      // });
    } catch (e) {
      // print('Error on emitting: $e');
      return emit(
        LoginFailure('Failed to login on server'),
      );
    }
  }
}
