import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '/constants/color.dart';
import '/constants/fonts.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: 'Forgot password ?'
          .text
          .color(titlecolor)
          .fontFamily(semibold)
          .make(),
    );
  }
}
