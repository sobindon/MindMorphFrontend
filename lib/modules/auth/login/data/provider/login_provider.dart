import 'package:http/http.dart' as http;
import '/constants/urls.dart';
import '../../models/login_request_model.dart';

Future<http.Response> loginProvider(LoginRequestModel userCredential) async {
  // print('User Credentials: ${userCredential.toJson()}');
  var uri = Uri.http(NODE_SERVER, '/login');
  // print('Requested URL: ${uri.toString()}');
  try {
    final response = await http.post(uri,
        // headers: {'Content-type': 'application/json'},
        body: userCredential.toJson());

    return response;
  }
  // on http.ClientException catch (e) {
  //   print('Error at Provider: $e');
  //   throw 'Server is offline or Invalid connection URL to server';
  // }

  catch (_) {
    // print('Error on Login Provider here: $_');
    rethrow;
  }
}
//lib\modules\auth\login\provider\login_provider.dart

// /login/unknownRoute ->  404
// 500 -> server error

//Narayan@Gautam123
//narayan@gmail.com
