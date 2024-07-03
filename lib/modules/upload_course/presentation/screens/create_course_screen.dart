// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../widgets/create_course/course_form.dart';
import '/constants/constants.dart';
import '/widgets/app_bar.dart';

class AddCourseScreen extends StatelessWidget {
  final int courseId;
  const AddCourseScreen({
    super.key,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MindMorphAppBar(title: 'Create Course'),
      backgroundColor: boxtilecolor,
      body: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: boxtilecolor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: CreateCourseForm(courseId: courseId),
      ),
    );
  }
}
