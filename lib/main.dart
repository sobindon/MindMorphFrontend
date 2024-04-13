import 'package:flutter/material.dart';

import 'config/themes/theme.dart';
import 'config/routes/route.dart';

void main() {
  runApp(const MindMorph());
}

class MindMorph extends StatelessWidget {
  const MindMorph({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Mind Morph',
      theme: theme,
      routerConfig: router,
    );
  }
}
