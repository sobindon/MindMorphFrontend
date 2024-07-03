import '../../models/login_response_model.dart';
import 'package:mindmorph/modules/auth/login/data/provider/login_provider.dart';
import 'package:mindmorph/modules/auth/login/data/local_storage/user_storage.dart';
import '../../models/login_request_model.dart';
import '../../models/repository_response_model.dart';

Future<LoginRepositoryModel> loginRepository(LoginRequestModel user) async {
  try {
    final providerResponse = await loginProvider(user);
    int statusCode = providerResponse.statusCode;

    // print(
    //     'Status: ${providerResponse.statusCode}, Response1: ${providerResponse.body} ');

    if (statusCode != 200) {
      return LoginRepositoryModel(
        status: statusCode,
        message:
            FailureLoginResponseModel.fromResponseBody(providerResponse.body)
                .message,
      );
    }

    final loginResponse =
        LoginResponseModel.fromResponseBody(providerResponse.body);
    // print('Response2: ${loginResponse.toString()}');
    //Save UserData in Shared Preference
    UserStorage.save(loginResponse.userData);

//Return Respponse
    return LoginRepositoryModel(
      status: statusCode,
      message: loginResponse.message,
    );
  } catch (e) {
    // print('Error on Login Repository: $e');
    return LoginRepositoryModel(
      status: 503,
      message: e.toString(),
    );
  }
}
