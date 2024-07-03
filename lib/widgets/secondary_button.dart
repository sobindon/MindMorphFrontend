import 'package:flutter/material.dart';
import 'package:mindmorph/constants/color.dart';
import 'package:mindmorph/constants/fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MindMorphSecondaryButton extends StatelessWidget {
  const MindMorphSecondaryButton({
    super.key,
    this.onTap,
    required this.labelText,
    this.width,
  });

  final void Function()? onTap;
  final String labelText;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: themecolor,
            border: Border.all(
                width: 1, color: const Color.fromARGB(255, 63, 73, 102)),
            borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.centerLeft,
        height: 60,
        width: width ?? 100,
        child: Align(
          alignment: Alignment.center,
          child: labelText.text
              .fontFamily(regular)
              .color(const Color.fromARGB(255, 127, 166, 197))
              .make(),
        ),
      ),
    );
  }
}
