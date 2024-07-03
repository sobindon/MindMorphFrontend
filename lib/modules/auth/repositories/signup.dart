import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:mindmorph/constants/urls.dart';
import '../models/signup.dart';

Future<SignupResponse> signup(UserSignupModel user) async {
  // const webPath = 'http://127.0.0.1:8000';
  var uri = Uri.http(NODE_SERVER, '/signup');

  try {
    final request = http.MultipartRequest('POST', uri)
      ..fields['fullName'] = user.fullName
      ..fields['email'] = user.email
      ..fields['password'] = user.password
      ..fields['role'] = user.role
      ..fields['birthdate'] = user.birthdate
      ..files.add(
        http.MultipartFile(
          'avatar',
          user.avatar.readAsBytes().asStream(),
          user.avatar.lengthSync(),
          filename: user.avatarName,
          contentType: MediaType('image', 'jpeg'),
        ),
      );
    Map<String, String> header = {'Content-type': 'multipart/form-data'};

    request.headers.addAll(header);
    final response = await http.Response.fromStream(await request.send());
    // print('Statuc code: ${response.statusCode}');
    final result = json.decode(response.body);
    return SignupResponse(
      status: response.statusCode,
      message: result['message'],
    );
  } catch (error) {
    return SignupResponse(message: error.toString());
  }
}
