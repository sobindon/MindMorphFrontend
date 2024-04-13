import 'package:flutter/material.dart';

final theme = ThemeData(
  canvasColor: const Color.fromARGB(221, 30, 29, 29),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)

      // subtitle1: const TextStyle(
      //   color: Color.fromARGB(255, 238, 206, 204), // <-- TextFormField input color
      // ),
      ),
);
