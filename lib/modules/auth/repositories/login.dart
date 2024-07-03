// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:mindmorph/storage/user/user_json_model.dart';
// import 'package:mindmorph/modules/auth/login/data/local_storage/user_storage.dart';
// import '/constants/urls.dart';
// import '../models/login.dart';

// Future<LoginResponse> login(UserLoginModel user) async {
//   var uri = Uri.http(mobilePath, 'login');

//   try {
//     final response = await http.post(uri,
//         // headers: {'Content-type': 'application/json'},
//         body: {'email': user.email, 'password': user.password});

//     final result = json.decode(response.body);

//     //Save UserData
//     Map<String, dynamic> userData = result['userData'];
//     final userStorageModel = UserStorageModel.fromJson(userData);
//     UserStorage.save(userStorageModel);

// //Return Respponse
//     return LoginResponse(
//         status: response.statusCode,
//         message: result['message'],
//         token: result['token']);
//   } catch (error) {
//     return LoginResponse(message: error.toString());
//   }
// }
