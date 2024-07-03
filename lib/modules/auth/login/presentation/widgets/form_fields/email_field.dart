import 'package:flutter/material.dart';
import '../../../data/validators/email_validator.dart' as validator;

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator.emailValidator,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Email',
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
