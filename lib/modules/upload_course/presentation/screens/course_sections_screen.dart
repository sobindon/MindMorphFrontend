import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:mindmorph/widgets/app_bar.dart';
import '../widgets/course_sections/sections_list.dart';
import '/constants/color.dart';

import 'package:velocity_x/velocity_x.dart';

class CourseSections extends StatelessWidget {
  const CourseSections({super.key, required this.courseId});
  final int courseId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MindMorphAppBar(
        title: 'Course Sections',
        actions: [
          IconButton(
              onPressed: () => context.go('/home'),
              icon: const Icon(Icons.home))
        ],
      ),
      body: Container(
        height: context.screenHeight,
        width: context.screenWidth,
        color: themecolor,
        child: SectionList(
          courseId: courseId,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/course/sections/add/$courseId'),
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }
}
