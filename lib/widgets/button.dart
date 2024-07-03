import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '/constants/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.labelText,
  });

  final VoidCallback? onTap;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border.all(width: 1, color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        height: 60,
        constraints:
            const BoxConstraints(minWidth: 100), // Making width flexible
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: labelText.text
            .fontFamily(regular)
            .color(Colors.white)
            .makeCentered(), // Using makeCentered for alignment
      ),
    ).p8(); // Adding vertical padding for better spacing
  }
}
