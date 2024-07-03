import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';
import '/constants/color.dart';
import '/constants/fonts.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.go('/signup');
      },
      child: 'Sign up  '.text.color(redColor).fontFamily(semibold).make(),
    );
  }
}
