import 'package:flutter/material.dart';

import '../../models/course_details.dart';

class DescriptionView extends StatelessWidget {
  const DescriptionView({super.key, required this.courseDetails});
  final CourseDetailsModel courseDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ShowTextDetails(title: 'Description', value: courseDetails.description),
        ShowTextDetails(title: 'Requirement', value: courseDetails.requirement),
        ShowTextDetails(title: 'Objectives', value: courseDetails.objective)
      ],
    );
  }
}

class ShowTextDetails extends StatelessWidget {
  const ShowTextDetails({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(color: Colors.amber, fontSize: 16),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            value,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}





// class CourseSectionView extends StatelessWidget {
//   const CourseSectionView({super.key, required this.courseId});
//   final int courseId;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: const BouncingScrollPhysics(),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text(
//             'Course Sections',
//             style: TextStyle(
//                 fontSize: 18, fontFamily: regular, color: featureColor),
//           ),
//           10.heightBox,
//           // SectionList(courseId: widget.courseId),
//           const Text(
//               'Descriptions ......................................................... jjj')

//           // 20.heightBox,
//           // const Row(
//           //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           //   children: [],
//           // ),
//           // 10.heightBox,
//           // const Divider(
//           //   thickness: 0.8,
//           //   color: Colors.white,
//           //   endIndent: 40,
//           //   indent: 40,
//           // ),
//           // 20.heightBox,
//           // 10.heightBox,
//           // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//           //   "Description"
//           //       .text
//           //       .color(featureColor)
//           //       .fontFamily(bold)
//           //       .size(20)
//           //       .make(),
//           //   "Rate course"
//           //       .text
//           //       .color(featureColor)
//           //       .fontFamily(bold)
//           //       .size(15)
//           //       .make(),
//           //   ratingbar(15, 8, 5)
//           // ]),
//           // const TextField(
//           //   style: TextStyle(color: Color.fromARGB(255, 137, 165, 204)),
//           //   decoration: InputDecoration(
//           //     border: OutlineInputBorder(),
//           //   ),
//           //   maxLines: 4,
//           //   keyboardType: TextInputType.multiline,
//           // ),
//           // Align(
//           //   alignment: Alignment.topLeft,
//           //   child: TextButton(
//           //     onPressed: () {
//           //       setState(() {
//           //         isvisible = !isvisible;
//           //         cmnt = isvisible ? 'showless' : 'Reviews';
//           //       });
//           //     },
//           //     child: Text(cmnt,
//           //         textAlign: TextAlign.start,
//           //         style: const TextStyle(
//           //           fontFamily: regular,
//           //           fontSize: 14,
//           //           color: Colors.white,
//           //         )),
//           //   ),
//           // ),
//           // Visibility(
//           //   visible: isvisible,
//           //   child: Container(
//           //     decoration: BoxDecoration(
//           //       borderRadius: BorderRadius.circular(20),
//           //       color: boxtilecolor,
//           //     ),
//           //     height: MediaQuery.of(context).size.height * 0.9,
//           //     width: MediaQuery.of(context).size.height * 0.95,
//           //     child: Column(
//           //       children: [
//           //         20.heightBox,
//           //         Container(
//           //           decoration: BoxDecoration(
//           //             borderRadius: BorderRadius.circular(10),
//           //             color: boxtilecolor,
//           //           ),
//           //           padding: const EdgeInsets.all(10),
//           //           height: MediaQuery.of(context).size.height * 0.15,
//           //           width: MediaQuery.of(context).size.height * 0.60,
//           //           child: Column(
//           //             children: [
//           //               Align(
//           //                 alignment: Alignment.topLeft,
//           //                 child: "sobin rai "
//           //                     .text
//           //                     .color(Colors.amber)
//           //                     .maxFontSize(20)
//           //                     .make(),
//           //               ),
//           //               ratingbar(10, 8, 4),
//           //               5.heightBox,
//           //               Align(
//           //                 alignment: Alignment.topLeft,
//           //                 child:
//           //                     "i recommend this course to every one who want really learn, i loved it.It describe all basic to pro level. "
//           //                         .text
//           //                         .color(featureColor)
//           //                         .maxFontSize(20)
//           //                         .make(),
//           //               ),
//           //             ],
//           //           ),
//           //         ),
//           //         const Divider(
//           //           thickness: 1,
//           //           color: featureColor,
//           //         ),
//           //         Container(
//           //           decoration: BoxDecoration(
//           //             borderRadius: BorderRadius.circular(10),
//           //             color: boxtilecolor,
//           //           ),
//           //           padding: const EdgeInsets.all(10),
//           //           height: MediaQuery.of(context).size.height * 0.15,
//           //           width: MediaQuery.of(context).size.height * 0.60,
//           //           child: Column(
//           //             children: [
//           //               Align(
//           //                 alignment: Alignment.topLeft,
//           //                 child: "Narayan Gautam "
//           //                     .text
//           //                     .color(Colors.amber)
//           //                     .maxFontSize(20)
//           //                     .make(),
//           //               ),
//           //               ratingbar(10, 8, 4),
//           //               5.heightBox,
//           //               Align(
//           //                 alignment: Alignment.topLeft,
//           //                 child:
//           //                     " i loved it.It describe all basic to pro level. "
//           //                         .text
//           //                         .color(featureColor)
//           //                         .maxFontSize(20)
//           //                         .make(),
//           //               ),
//           //             ],
//           //           ),
//           //         ),
//           //         const Divider(
//           //           thickness: 1,
//           //           color: featureColor,
//           //         ),
//           //         Container(
//           //           decoration: BoxDecoration(
//           //             borderRadius: BorderRadius.circular(10),
//           //             color: boxtilecolor,
//           //           ),
//           //           padding: const EdgeInsets.all(10),
//           //           height: MediaQuery.of(context).size.height * 0.15,
//           //           width: MediaQuery.of(context).size.height * 0.60,
//           //           child: Column(
//           //             children: [
//           //               Align(
//           //                 alignment: Alignment.topLeft,
//           //                 child: "Suraj Kumar Yadav "
//           //                     .text
//           //                     .color(Colors.amber)
//           //                     .maxFontSize(20)
//           //                     .make(),
//           //               ),
//           //               ratingbar(10, 8, 4),
//           //               5.heightBox,
//           //               Align(
//           //                 alignment: Alignment.topLeft,
//           //                 child:
//           //                     ".It describe all basic to pro level.i liked it "
//           //                         .text
//           //                         .color(featureColor)
//           //                         .maxFontSize(20)
//           //                         .make(),
//           //               ),
//           //             ],
//           //           ),
//           //         ),
//           //         const Divider(
//           //           thickness: 1,
//           //           color: featureColor,
//           //         ),
//           //       ],
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

// class CourseSection extends StatelessWidget {
//   const CourseSection({
//     super.key,
//     required this.controller,
//     required this.user,
//   });

//   final ExpansionTileController controller;
//   final List<User> user;

//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTile(
//       maintainState: true,
//       controller: controller,
//       title: const Text(
//         'Course Chapters',
//         style: TextStyle(color: Vx.amber100),
//       ),
//       children: <Widget>[
//         Container(
//           height: 250,
//           width: 500,
//           color: backgrounghilghtcolor,
//           child: ListView.builder(
//               itemCount: user.length,
//               itemBuilder: ((context, index) {
//                 final users = user[index];
//                 return Container(
//                   height: 80,
//                   color: boxtilecolor,
//                   child: ListTile(
//                     contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 20.0, vertical: 20.0),
//                     title: Text(
//                       users.sectionname,
//                       style: const TextStyle(color: titlecolor),
//                     ),
//                     subtitle: Text(
//                       users.length,
//                       style: const TextStyle(color: featureColor),
//                     ),
//                     trailing: const Icon(Icons.arrow_forward_ios),
//                     onTap: () => context.go('/playenrollcourse'),
//                   ),
//                 );
//               })),
//         ),
//       ],
//     );
//   }
// }
