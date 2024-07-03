import 'package:flutter/material.dart';
import '/constants/constants.dart';

class MindMorphFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const MindMorphFormField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.validator,
      this.maxLines,
      this.minLines,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        maxLines: maxLines ?? 10,
        minLines: minLines ?? 2,
        autofocus: true,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          // hintText: 'Text Hint',
          // hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
          labelText: labelText,
          labelStyle:
              const TextStyle(color: featureColor, fontFamily: semibold),
          border: const UnderlineInputBorder(),
        ),
        style: const TextStyle(
          color: textFormFieldColor,
        ),
      ),
    );
  }
}
