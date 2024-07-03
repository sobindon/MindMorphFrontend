import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> mindMorphSnackBar(
    {required BuildContext context,
    required String message,
    bool isError = false}) {
  Color? defaultColor =
      Colors.green; //ThemeData().snackBarTheme.backgroundColor;

  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: isError ? Colors.red : defaultColor,
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}

// typedef MySnackbar = ScaffoldFeatureController<SnackBar, SnackBarClosedReason>;

// class ShowSnackBar {
//   ShowSnackBar({required this.context, required this.message});
//   final BuildContext context;
//   final String messageBuildContext context;
//   final String message;
//   Color? _color =
//       ThemeData().snackBarTheme.backgroundColor;

//   MySnackbar _show() => ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           backgroundColor: _color,
//           content: Text(message),
//         ),
//       );

//   MySnackbar get error {
//     _color = Colors.red;
//     return _show();
//   }
// }
