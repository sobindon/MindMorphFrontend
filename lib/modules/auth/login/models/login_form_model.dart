import 'package:flutter/material.dart';

import 'login_request_model.dart';

class LoginFormControllerModel {
  final email = TextEditingController();
  final password = TextEditingController();

  LoginFormControllerModel();

  LoginRequestModel get data {
    return LoginRequestModel(
        email: email.text.trim(), password: password.text.trim());
  }
}
