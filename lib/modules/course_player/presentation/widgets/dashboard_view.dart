import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindmorph/constants/urls.dart';
import 'package:mindmorph/modules/course_player/data/repositories/course_repository.dart';
import 'package:mindmorph/utils/get_formated_time.dart';
import 'package:mindmorph/widgets/loading_indicator.dart';
import '../../../upload_course/data/repositories/course_section.dart';
import '../../../upload_course/models/course_section/section_preview_response.dart';
import '/constants/color.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../bloc/imports.dart';
import 'course_details.dart';
import 'dashboard/dashboard_tab_controller.dart';
import 'xyz_player.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key, required this.courseData});
  final CourseResponse courseData;

  @override
  Widget build(BuildContext context) {
    final course = courseData.course;
    final courseDetails = courseData.courseDetails;

    return BlocProvider(
      create: (context) => VideoBloc(courseDetails.titleVideoUrl),
      child: Scaffold(
        backgroundColor: themecolor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<VideoBloc, VideoState>(
                  builder: (context, state) {
                    final videoUrl = 'http://$COURSE_SERVER/${state.videoUrl}';
                    // return Text(videoUrl);
                    //return  MindMorphVideoPlayer(
                    //   videoUrl: videoUrl,
                    // );

                    return XYZPlayer(videoUrl: videoUrl);
                  },
                ),
                5.heightBox,
                CourseDetails(course: course, title: courseDetails.title),
                DashboardTabController(
                  courseDetails: courseDetails,
                  courseSectionView:
                      FutureBuilder<List<CourseSectionResponseModel>>(
                    future: CourseSectionRepository.previewSection(
                        courseId: course.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const MindMorphLoadingIndicator();
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No data available'));
                      } else {
                        List<CourseSectionResponseModel> sections =
                            snapshot.data!;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: sections.length,
                          itemBuilder: (context, index) {
                            final section = sections[index];

                            return ExpansionTile(
                              maintainState: true,
                              tilePadding: const EdgeInsets.only(left: 8),
                              title: Text(
                                section.title,
                                style: const TextStyle(color: Vx.amber100),
                              ),
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: section.lectures.length,
                                  itemBuilder: ((context, index) {
                                    final lecture = section.lectures[index];
                                    return ListTile(
                                      title: Text(
                                        lecture.title,
                                        style:
                                            const TextStyle(color: titlecolor),
                                      ),
                                      subtitle: Text(
                                        getFormatedTime(
                                            seconds: lecture.duration),
                                        style: const TextStyle(
                                            color: featureColor),
                                      ),
                                      onTap: () {
                                        context
                                            .read<VideoBloc>()
                                            .add(VideoUrlChanged(lecture.file));
                                      },
                                    );
                                  }),
                                )
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
