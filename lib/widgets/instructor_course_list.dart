import 'package:flutter/material.dart';
import '/constants/color.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themecolor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Courses',
            style: TextStyle(color: featureColor, fontSize: 20)),
        iconTheme: const IconThemeData(color: titlecolor),
        backgroundColor: const Color.fromARGB(255, 8, 27, 42),
      ),
      body: const Center(
          child: Text(
        'No data available',
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
