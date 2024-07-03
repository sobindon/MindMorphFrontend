import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

import '/constants/fonts.dart';
import '/constants/color.dart';

List<Widget> decorationWidgets() {
  return [
    50.heightBox,
    Align(
      child: SizedBox(
        height: 200,
        width: 200,
        child: Lottie.asset('assets/images/login.json'),
      ),
    ),
    const Divider(
      thickness: 2,
      color: titlecolor,
      endIndent: 60,
      indent: 60,
    ),
    30.heightBox,
    Align(
      alignment: Alignment.centerLeft,
      child: 'Login'
          .text
          .color(titlecolor)
          .size(30)
          .fontWeight(FontWeight.bold)
          .fontFamily(bold)
          .make(),
    ),
    10.heightBox,
    Align(
      alignment: Alignment.centerLeft,
      child: 'Please fill the inputs below'
          .text
          .size(14)
          .color(subtexColor)
          .fontFamily(regular)
          .make(),
    )
  ];
}
