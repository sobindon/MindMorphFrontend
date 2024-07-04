import 'package:go_router/go_router.dart';

import '../../modules/cart/presentation/screens/cart_screen.dart';

List<RouteBase> cartRoutes = [
  GoRoute(
    name:
        'cart', // Optional, add name to your routes. Allows you navigate by name instead of path
    path: '/cart',
    builder: (context, state) => CartScreen(),
  ),
];
