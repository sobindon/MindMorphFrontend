import 'package:flutter/material.dart';

class UserLoginModel {
  String email, password;

  UserLoginModel({required this.email, required this.password});
}

class LoginResponse {
  int? status;
  String message;
  String? token;
  LoginResponse({this.status, this.token, required this.message});
}

class LoginFormModel {
  final email = TextEditingController();
  final password = TextEditingController();

  LoginFormModel();

  UserLoginModel get data {
    return UserLoginModel(
        email: email.text.trim(), password: password.text.trim());
  }
}
