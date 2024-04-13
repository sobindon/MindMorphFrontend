import 'package:go_router/go_router.dart';
import 'package:mindmorph/modules/auth/screens/signup.dart';
import 'package:mindmorph/modules/home/screens/home.dart';
import '/modules/auth/screens/login.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      name:
          'signup', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/signup',
      builder: (context, state) => const Signup(),
    ),
    GoRoute(
      name:
          'home', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/home',
      builder: (context, state) => const Home(),
    ),
  ],
);
