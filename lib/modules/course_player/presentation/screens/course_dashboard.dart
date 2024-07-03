import 'package:flutter/material.dart';
import 'package:mindmorph/widgets/loading_indicator.dart';
import '../../data/repositories/course_repository.dart';
import '../widgets/dashboard_view.dart';

class CourseDashboard extends StatelessWidget {
  const CourseDashboard({super.key, required this.courseId});

  final int courseId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<CourseResponse>(
        future: CourseResponse.getData(courseId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MindMorphLoadingIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No data available'));
          } else {
            final courseData = snapshot.data!;
            return DashboardView(courseData: courseData);
          }
        },
      ),
    );
  }
}
