import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:mindmorph/widgets/app_bar.dart';
import '../../models/course_section/upload_lecture.dart';
import '/constants/color.dart';
import '../widgets/course_sections/upload_section_files.dart';

// uploadLecture

class UploadCourseSectionsScreen extends StatelessWidget {
  const UploadCourseSectionsScreen(
      {super.key,
      required this.sectionId,
      required this.courseId,
      required this.lecturesData});
  final String sectionId;
  final int courseId;
  final List<UploadLectureData> lecturesData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MindMorphAppBar(
          title: 'Upload Section Files',
        ),
        backgroundColor: themecolor,
        body: UploadProgressView(
          courseId: courseId,
          lecturesData: lecturesData,
          sectionId: sectionId,
        ));
  }
}
