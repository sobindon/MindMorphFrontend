// import 'package:appinio_video_player/appinio_video_player.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import '../../video_player/models/course_model.dart';
// import '../../video_player/data/providers/course_provider.dart';
// import '../commonwidget/ratingbar.dart';
// import '/constants/color.dart';
// import '/constants/fonts.dart';
// import 'package:velocity_x/velocity_x.dart';

// class User {
//   final String sectionname;
//   final String length;

//   User({
//     required this.sectionname,
//     required this.length,
//   });
// }

// class VideoPlayer extends StatefulWidget {
//   int? courseId;
//   VideoPlayer({super.key, this.courseId});

//   @override
//   State<VideoPlayer> createState() => _VideoPlayerState();
// }

// // ignore: camel_case_types
// class _VideoPlayerState extends State<VideoPlayer> {
//   late CustomVideoPlayerController _customVideoPlayerController;
//   bool isvisible = true;
//   String toggle = 'Showless';
//   String cmnt = 'showles';
//   String add = 'showles';
//   String addtoggle = "hide";

//   TextEditingController _descriptionController = TextEditingController();
//   List<User> user = [
//     User(sectionname: 'Introduction', length: '2:40'),
//     User(sectionname: 'Dart data types ', length: '8:20'),
//     User(sectionname: 'basic widget introduction', length: '10:10'),
//     User(sectionname: 'flutter First course', length: '15:20'),
//   ];
//   final ExpansionTileController controller = ExpansionTileController();

//   @override
//   void initState() {
//     super.initState();
//     initializevideoplayer();
//   }

//   @override
//   void dispose() {
//     _customVideoPlayerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<CourseModel>(
//       future: widget.courseId != null ? getCourse(widget.courseId!) : null,
//       builder: (BuildContext context, AsyncSnapshot<CourseModel> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // Show a loading indicator while waiting for the data
//           return const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         } else if (snapshot.hasError) {
//           // Show an error message if the data couldn't be fetched
//           return Scaffold(
//             body: Center(
//               child: Text('Error: ${snapshot.error}'),
//             ),
//           );
//         } else {
//           // Data has been successfully fetched, display the course details
//           CourseModel courseModel = snapshot.data!;
//           return Scaffold(
//             body: Container(
//               color: themecolor,
//               child: SafeArea(
//                 child: Column(children: [
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   CustomVideoPlayer(
//                       customVideoPlayerController:
//                           _customVideoPlayerController),
//                   5.heightBox,
//                   Container(
//                     decoration: BoxDecoration(boxShadow: [
//                       BoxShadow(
//                         color: const Color.fromARGB(255, 249, 249, 249)
//                             .withOpacity(0.2),
//                         blurRadius: 7,
//                         offset: const Offset(0, 3),
//                       ),
//                     ], color: themecolor),
//                     height: MediaQuery.of(context).size.height * 0.15,
//                     child: Column(
//                       children: [
//                         Align(
//                           alignment: Alignment.topLeft,
//                           child: Title(
//                             color: Colors.white,
//                             child: Text(
//                               courseModel.title,
//                               style: const TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                         10.heightBox,
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 'Rating'
//                                     .text
//                                     .size(16)
//                                     .fontFamily(semibold)
//                                     .color(subtexColor)
//                                     .make(),
//                                 const SizedBox(width: 10),
//                                 ratingbar(20, 0.8, courseModel.rating),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 'Rs ${courseModel.price}'
//                                     .text
//                                     .color(Colors.amber)
//                                     .make(),
//                                 const SizedBox(width: 20)
//                               ],
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             courseModel.author.fullName.text
//                                 .size(16)
//                                 .fontFamily(bold)
//                                 .color(subtexColor)
//                                 .make(),

//                             // Align(
//                             //   alignment: Alignment.centerLeft,
//                             //   child: courseModel.author.fullName.text
//                             //       .size(16)
//                             //       .fontFamily(bold)
//                             //       .color(subtexColor)
//                             //       .make(),
//                             // ),
//                             // const SizedBox(
//                             //   width: 15,
//                             // ),
//                             // 20.heightBox,
//                             const Icon(
//                               Icons.language,
//                               color: subtexColor,
//                             ),
//                             '${courseModel.language}'
//                                 .text
//                                 .size(14)
//                                 .color(subtexColor)
//                                 .make(),
//                             // 20.widthBox,
//                             Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 // width: 120,
//                                 decoration: BoxDecoration(
//                                     color: boxtilecolor,
//                                     borderRadius: BorderRadius.circular(20)),
//                                 child: '👨‍🎓  ${courseModel.enrollCount}'
//                                     .text
//                                     .color(subtexColor)
//                                     .size(14)
//                                     .make(),
//                               ),
//                             ),
//                           ],
//                         ),
//                         20.heightBox,
//                       ],
//                     ),
//                   ),
//                   10.heightBox,
//                   Expanded(
//                     child: SingleChildScrollView(
//                       physics: const BouncingScrollPhysics(),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           5.heightBox,
//                           Column(
//                             children: [
//                               5.heightBox,
//                               Align(
//                                 alignment: Alignment.center,
//                                 child: Title(
//                                     color: const Color.fromARGB(
//                                         255, 255, 255, 255),
//                                     child: const Text(
//                                       'Course details',
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           fontFamily: regular,
//                                           color: featureColor),
//                                     )),
//                               ),
//                               10.heightBox,
//                               CourseSection(controller: controller, user: user),
//                               CourseSection(controller: controller, user: user),
//                               Column(
//                                 children: [
//                                   // ExpansionTile(
//                                   //   maintainState: true,
//                                   //   controller: controller,
//                                   //   title: const Text(
//                                   //     'Course Chapters',
//                                   //     style: TextStyle(color: Vx.amber100),
//                                   //   ),
//                                   //   children: <Widget>[
//                                   //     Container(
//                                   //       height: 250,
//                                   //       width: 500,
//                                   //       color: backgrounghilghtcolor,
//                                   //       child: ListView.builder(
//                                   //           itemCount: user.length,
//                                   //           itemBuilder: ((context, index) {
//                                   //             final users = user[index];
//                                   //             return Container(
//                                   //               height: 80,
//                                   //               color: boxtilecolor,
//                                   //               child: ListTile(
//                                   //                 contentPadding:
//                                   //                     const EdgeInsets
//                                   //                         .symmetric(
//                                   //                         horizontal: 20.0,
//                                   //                         vertical: 20.0),
//                                   //                 title: Text(
//                                   //                   users.sectionname,
//                                   //                   style: const TextStyle(
//                                   //                       color: titlecolor),
//                                   //                 ),
//                                   //                 subtitle: Text(
//                                   //                   users.length,
//                                   //                   style: const TextStyle(
//                                   //                       color: featureColor),
//                                   //                 ),
//                                   //                 trailing: const Icon(
//                                   //                     Icons.arrow_forward_ios),
//                                   //                 onTap: () => context
//                                   //                     .go('/playenrollcourse'),
//                                   //               ),
//                                   //             );
//                                   //           })),
//                                   //     ),
//                                   //   ],
//                                   // ),
//                                 ],
//                               )
//                             ],
//                           ),
//                           20.heightBox,
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [],
//                           ),
//                           10.heightBox,
//                           const Divider(
//                             thickness: 0.8,
//                             color: Colors.white,
//                             endIndent: 40,
//                             indent: 40,
//                           ),
//                           20.heightBox,
//                           10.heightBox,
//                           Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 "Description"
//                                     .text
//                                     .color(featureColor)
//                                     .fontFamily(bold)
//                                     .size(20)
//                                     .make(),
//                                 "Rate course"
//                                     .text
//                                     .color(featureColor)
//                                     .fontFamily(bold)
//                                     .size(15)
//                                     .make(),
//                                 ratingbar(15, 8, 5)
//                               ]),
//                           const TextField(
//                             style: TextStyle(
//                                 color: Color.fromARGB(255, 137, 165, 204)),
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(),
//                             ),
//                             maxLines: 4,
//                             keyboardType: TextInputType.multiline,
//                           ),

//                           Align(
//                             alignment: Alignment.topLeft,
//                             child: TextButton(
//                               onPressed: () {
//                                 setState(() {
//                                   isvisible = !isvisible;
//                                   cmnt = isvisible ? 'showless' : 'Reviews';
//                                 });
//                               },
//                               child: Text(cmnt,
//                                   textAlign: TextAlign.start,
//                                   style: const TextStyle(
//                                     fontFamily: regular,
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                   )),
//                             ),
//                           ),
//                           Visibility(
//                             visible: isvisible,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: boxtilecolor,
//                               ),
//                               height: MediaQuery.of(context).size.height * 0.9,
//                               width: MediaQuery.of(context).size.height * 0.95,
//                               child: Column(
//                                 children: [
//                                   20.heightBox,
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: boxtilecolor,
//                                     ),
//                                     padding: const EdgeInsets.all(10),
//                                     height: MediaQuery.of(context).size.height *
//                                         0.15,
//                                     width: MediaQuery.of(context).size.height *
//                                         0.60,
//                                     child: Column(
//                                       children: [
//                                         Align(
//                                           alignment: Alignment.topLeft,
//                                           child: "sobin rai "
//                                               .text
//                                               .color(Colors.amber)
//                                               .maxFontSize(20)
//                                               .make(),
//                                         ),
//                                         ratingbar(10, 8, 4),
//                                         5.heightBox,
//                                         Align(
//                                           alignment: Alignment.topLeft,
//                                           child:
//                                               "i recommend this course to every one who want really learn, i loved it.It describe all basic to pro level. "
//                                                   .text
//                                                   .color(featureColor)
//                                                   .maxFontSize(20)
//                                                   .make(),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const Divider(
//                                     thickness: 1,
//                                     color: featureColor,
//                                   ),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: boxtilecolor,
//                                     ),
//                                     padding: const EdgeInsets.all(10),
//                                     height: MediaQuery.of(context).size.height *
//                                         0.15,
//                                     width: MediaQuery.of(context).size.height *
//                                         0.60,
//                                     child: Column(
//                                       children: [
//                                         Align(
//                                           alignment: Alignment.topLeft,
//                                           child: "Narayan Gautam "
//                                               .text
//                                               .color(Colors.amber)
//                                               .maxFontSize(20)
//                                               .make(),
//                                         ),
//                                         ratingbar(10, 8, 4),
//                                         5.heightBox,
//                                         Align(
//                                           alignment: Alignment.topLeft,
//                                           child:
//                                               " i loved it.It describe all basic to pro level. "
//                                                   .text
//                                                   .color(featureColor)
//                                                   .maxFontSize(20)
//                                                   .make(),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const Divider(
//                                     thickness: 1,
//                                     color: featureColor,
//                                   ),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: boxtilecolor,
//                                     ),
//                                     padding: const EdgeInsets.all(10),
//                                     height: MediaQuery.of(context).size.height *
//                                         0.15,
//                                     width: MediaQuery.of(context).size.height *
//                                         0.60,
//                                     child: Column(
//                                       children: [
//                                         Align(
//                                           alignment: Alignment.topLeft,
//                                           child: "Suraj Kumar Yadav "
//                                               .text
//                                               .color(Colors.amber)
//                                               .maxFontSize(20)
//                                               .make(),
//                                         ),
//                                         ratingbar(10, 8, 4),
//                                         5.heightBox,
//                                         Align(
//                                           alignment: Alignment.topLeft,
//                                           child:
//                                               ".It describe all basic to pro level.i liked it "
//                                                   .text
//                                                   .color(featureColor)
//                                                   .maxFontSize(20)
//                                                   .make(),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const Divider(
//                                     thickness: 1,
//                                     color: featureColor,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),

//                           // Visibility(
//                           //   visible: isvisible,
//                           //   child: Container(
//                           //     decoration: BoxDecoration(
//                           //       borderRadius: BorderRadius.circular(20),
//                           //       color: boxtilecolor,
//                           //     ),
//                           //     height: 350,
//                           //     width: 350,s
//                           //     child: Column(
//                           //       children: [],
//                           //     ),
//                           //   ),
//                           // ),
//                           // 10.heightBox,
//                           // divider,
//                           // 10.heightBox,
//                           // 10.heightBox,
//                           // divider,
//                         ],
//                       ),
//                     ),
//                   )
//                 ]),
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }

//   void initializevideoplayer() {
//     CachedVideoPlayerController _CachedVideoPlayerController;
//     _CachedVideoPlayerController = CachedVideoPlayerController.network(
//         'https://www.w3schools.com/html/mov_bbb.mp4')
//       ..initialize().then((value) {
//         setState(() {});
//       });
//     _customVideoPlayerController = CustomVideoPlayerController(
//         context: context, videoPlayerController: _CachedVideoPlayerController);
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
