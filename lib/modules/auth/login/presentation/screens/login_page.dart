import 'package:flutter/material.dart';
import 'package:mindmorph/constants/color.dart';
import 'package:mindmorph/modules/auth/login/models/login_form_model.dart';
import 'package:mindmorph/modules/auth/login/presentation/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final formController = LoginFormControllerModel();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: themecolor,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...decorationWidgets(),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    EmailFormField(controller: formController.email),
                    PasswordFormField(controller: formController.password),
                    20.heightBox,
                    LoginButton(
                      formController: formController,
                      formKey: _formKey,
                    ),
                    10.heightBox,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ForgetPasswordButton(),
                        SignupButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void proceedToLogin(BuildContext context, GlobalKey<FormState> formKey) async {

  // if (!formKey.currentState!.validate()) return;

  //   context
  //       .read<LoginBloc>()
  //       .add(LoginRequested(email: email, password: password));

  //   LoginResponse response = await login(formController.data);
  //   SnackBar snackBar;
  //   if (response.status == 200) {
  //     snackBar = SnackBar(
  //       backgroundColor: Colors.green,
  //       content:
  //           Text(response.message, style: const TextStyle(color: Colors.white)),
  //       action: SnackBarAction(
  //         textColor: const Color.fromARGB(255, 9, 115, 202),
  //         label: 'Proceed to Home Page',
  //         onPressed: () => context.go('/home'),
  //       ),
  //     );
  //     Timer(const Duration(seconds: 1), () => context.go('/home'));
  //   } else {
  //     snackBar = SnackBar(
  //         backgroundColor: Colors.red,
  //         content: Text(response.message,
  //             style: const TextStyle(color: Colors.white)));
  //   }
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }
}
