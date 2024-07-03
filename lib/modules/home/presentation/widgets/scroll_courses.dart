import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';
import '/modules/home/models/course_view_model.dart';
import '/constants/color.dart';
import '/constants/urls.dart';
import '../../../screens/commonwidget/coursettitle/coursetitle.dart';

class ScrollCourse extends StatelessWidget {
  const ScrollCourse({super.key, required this.courses});

  final List<CourseViewModel> courses;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgrounghilghtcolor,
      shadowColor: const Color.fromARGB(255, 17, 17, 16),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        height: 170,
        width: 500,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              courses.length,
              (index) => GestureDetector(
                onTap: () {
                  int courseId = courses[index].id;

                  context.push('/course/dashboard/$courseId');
                },
                child: Container(
                  height: 250,
                  width: 178,
                  padding: const EdgeInsets.all(7),
                  child: Column(
                    children: [
                      featurelistRow(
                          image:
                              'http://$NODE_SERVER/${courses[index].thumbnail}',
                          name: courses[index].title,
                          price: courses[index].price.toString(),
                          countstar: courses[index].rating,
                          isNetwork: true),
                    ],
                  ).box.make(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
