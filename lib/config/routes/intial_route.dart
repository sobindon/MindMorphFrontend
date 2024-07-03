import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/modules/auth/login/data/local_storage/user_storage.dart';
import '/modules/home/presentation/screens/home_screen.dart';
import '/modules/auth/login/presentation/screens/login.dart';

final initialRoute = GoRoute(
  name: 'initial',
  path: '/initial',
  builder: (context, state) => FutureBuilder(
    future: UserStorage.isLogin(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        // Future hasn't finished yet, return a placeholder
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      // Now Future is completed
      bool status = snapshot.data ?? false;
      if (status) return const HomeScreen();
      return const Login();
    },
  ),
);
