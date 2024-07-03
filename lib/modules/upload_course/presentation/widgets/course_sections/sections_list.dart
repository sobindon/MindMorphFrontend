import 'package:flutter/material.dart';

import 'package:mindmorph/widgets/loading_indicator.dart';
import '../../../data/repositories/course_section.dart';
import '../../../models/course_section/section_preview_response.dart';

import 'collapsible_view.dart';

class SectionList extends StatelessWidget {
  const SectionList({super.key, required this.courseId});
  final int courseId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CourseSectionResponseModel>>(
      future: CourseSectionRepository.previewSection(courseId: courseId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MindMorphLoadingIndicator();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          List<CourseSectionResponseModel> sections = snapshot.data!;
          return ListView.builder(
            itemCount: sections.length,
            itemBuilder: (context, index) {
              final section = sections[index];

              return CollapsibleView(section: section);
            },
          );
        }
      },
    );
  }
}
