import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mindmorph/constants/color.dart';
import 'package:mindmorph/widgets/app_bar.dart';
import '../../bloc/course_init/course_initialize_bloc.dart';
import '../widgets/initialize_course/form_content.dart';

class InitializeCourseScreen extends StatefulWidget {
  const InitializeCourseScreen({super.key});

  @override
  State<InitializeCourseScreen> createState() => _InitializeCourseScreenState();
}

class _InitializeCourseScreenState extends State<InitializeCourseScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ListFetchBloc>().add(FetchList1());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ListFetchBloc()..add(FetchList1()),
      child: Scaffold(
        appBar: const MindMorphAppBar(title: 'Initialize a new Course'),
        backgroundColor: boxtilecolor,
        body: BlocListener<ListFetchBloc, ListFetchState>(
          listener: (context, state) {
            if (state is SubmissionSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.courseInitResponse.message)),
              );
              context.pop();
              print('Craeted course id: ${state.courseInitResponse.courseId}');
              context.go('/course/create/${state.courseInitResponse.courseId}');
            } else if (state is SubmissionError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Submission Failed: ${state.message}')),
              );
            }
          },
          child: const FormContent(),
        ),
      ),
    );
  }
}
