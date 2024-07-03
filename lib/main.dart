import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/themes/theme.dart';
import 'config/routes/route.dart';
import 'modules/auth/login/bloc/login_bloc.dart';
import 'modules/upload_course/bloc/course_init/course_initialize_bloc.dart';

void main() {
  runApp(const MindMorph());
}

class MindMorph extends StatelessWidget {
  const MindMorph({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (_) => ListFetchBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Mind Morph',
        theme: theme,
        routerConfig: router,
      ),
    );
  }
}
