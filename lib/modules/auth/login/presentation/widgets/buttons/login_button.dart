import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../bloc/login_bloc.dart';
import '../../../models/login_form_model.dart';
import '/constants/color.dart';
import '/constants/fonts.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key, required this.formController, required this.formKey});

  final LoginFormControllerModel formController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
            const Color.fromARGB(255, 24, 35, 115)),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        minimumSize: WidgetStateProperty.all<Size>(
          const Size(200.0, 40.0), // Adjust the width and height as needed
        ),
      ),
      onPressed: () {
        if (!formKey.currentState!.validate()) return;

        String email = formController.email.text.trim();
        String password = formController.password.text.trim();

        context
            .read<LoginBloc>()
            .add(LoginRequested(email: email, password: password));
      },
      child:
          'Log In'.text.color(titlecolor).fontFamily(regular).size(18).make(),
    );
  }
}
