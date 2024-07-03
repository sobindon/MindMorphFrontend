import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmorph/constants/color.dart';

import 'package:mindmorph/modules/course_player/presentation/widgets/description_view.dart';
import 'package:mindmorph/modules/course_player/presentation/widgets/review_view.dart';

import '../../../models/course_details.dart';

class DashboardTabController extends StatelessWidget {
  const DashboardTabController(
      {super.key,
      required this.courseDetails,
      required this.courseSectionView});

  final CourseDetailsModel courseDetails;
  final Widget courseSectionView;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(children: [
        Container(
          height: 30,
          color: themecolor,
          width: context.width,
          child: const TabBar(
            // labelColor: Colors.black,
            indicatorColor: Colors.amber,
            tabs: [
              Tab(text: 'Details'),
              Tab(text: 'Sections'),
              Tab(text: 'Reviews'),
            ],
          ),
        ),
        SizedBox(
          height: context.height * 1.3,
          child: TabBarView(
            children: [
              DescriptionView(courseDetails: courseDetails),
              courseSectionView,
              // const SectionListView(),

              const Column(
                children: [
                  ReviewView(),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
