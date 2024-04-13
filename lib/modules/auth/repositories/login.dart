import 'dart:convert';
import 'package:http/http.dart' as http;
import '/constants/urls.dart';
import '../models/login.dart';

Future<LoginResponse> login(UserLoginModel user) async {
  var uri = Uri.http(mobilePath, 'login');

  try {
    final response = await http.post(uri,
        // headers: {'Content-type': 'application/json'},
        body: {'email': user.email, 'password': user.password});

    final result = json.decode(response.body);
    return LoginResponse(
        status: response.statusCode,
        message: result['message'],
        token: result['token']);
  } catch (error) {
    return LoginResponse(message: error.toString());
  }
}
