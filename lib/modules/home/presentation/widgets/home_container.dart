import 'package:flutter/material.dart';
import 'package:mindmorph/constants/color.dart';
import 'package:mindmorph/modules/home/models/course_view_model.dart';
import 'carousel_course.dart';
import 'feature_courses.dart';
import 'scroll_courses_title.dart';
import 'top_nav_bar.dart';
import 'package:mindmorph/modules/home/presentation/widgets/scroll_courses.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key,
    required this.trendingCourses,
    required this.newCourses,
  });

  final List<CourseViewModel> trendingCourses;
  final List<CourseViewModel> newCourses;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: themecolor,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(children: [
          const TopNavBar(),
          const SizedBox(height: 40),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const CarouselCourse(),
                const SizedBox(height: 10),
                const Divider(
                  thickness: 0.8,
                  color: Color.fromARGB(255, 148, 145, 145),
                ),
                const ScrollCoursesTitle(title: 'Trending Courses'),
                ScrollCourse(courses: trendingCourses),
                const ScrollCoursesTitle(title: 'New Courses'),
                ScrollCourse(courses: newCourses),
                const ScrollCoursesTitle(title: 'Features course'),
                const FeatureCourseList(),
              ],
            ),
          )),
        ]),
      ),
    );
  }
}
