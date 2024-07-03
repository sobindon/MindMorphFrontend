import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/login_bloc.dart';
import 'login_page.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  // static String routeName = 'login', routePath = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // resizeToAvoidBottomInset: false,
      body: BlocConsumer<LoginBloc, LoginState>(listener: ((context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is LoginSuccess) {
          context.go('/home');
        }
      }), builder: (context, state) {
        if (state is LoginLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        }

        return LoginPage();
      }),
    );
  }
}
