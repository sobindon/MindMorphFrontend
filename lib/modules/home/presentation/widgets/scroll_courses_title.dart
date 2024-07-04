import 'package:flutter/material.dart';
import 'package:mindmorph/constants/color.dart';
import 'package:velocity_x/velocity_x.dart';

class ScrollCoursesTitle extends StatelessWidget {
  const ScrollCoursesTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 5),
      child: Align(
        alignment: Alignment.topLeft,
        child: title.text.color(featureColor).bold.size(20).make(),
      ),
    );
  }
}
