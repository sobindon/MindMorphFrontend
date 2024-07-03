import 'package:flutter/material.dart';
// import '../../../data/validators/password_validator.dart' as validator;

class PasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordFormField({super.key, required this.controller});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      // validator: validator.passwordValidator,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: const Color.fromARGB(255, 65, 60, 75),
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      style: const TextStyle(color: Colors.white),
      obscureText: _obscureText,
    );
  }
}
