import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constants/color.dart';
import 'mcqpage.dart';

class User {
  final String coursename;
  final String assignment;
  final String urlAvatar;
  User(
      {required this.urlAvatar,
      required this.assignment,
      required this.coursename});
}

class Coursesmcqlist extends StatelessWidget {
  Coursesmcqlist({super.key});
  final List<User> user = [
    User(
        urlAvatar:
            'https://i.pinimg.com/736x/cf/0b/74/cf0b7475f26c043b55fe50cfb98c15d5.jpg',
        assignment: 'MCQ',
        coursename: 'fllutter basic'),
    User(
        urlAvatar:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQgWejE2_K0DKRYUP09A1nuMu6CuIs3oULFak4QA4YLA&',
        assignment: 'MCQ',
        coursename: 'java full course'),
    User(
        urlAvatar:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Neil_deGrasse_Tyson_in_June_2017_%28cropped%29.jpg/1200px-Neil_deGrasse_Tyson_in_June_2017_%28cropped%29.jpg',
        assignment: 'MCQ',
        coursename: 'Devops'),
    User(
        urlAvatar:
            'https://i.pinimg.com/736x/cf/0b/74/cf0b7475f26c043b55fe50cfb98c15d5.jpg',
        assignment: 'MCQ',
        coursename: 'fllutter basic'),
    User(
        urlAvatar:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQgWejE2_K0DKRYUP09A1nuMu6CuIs3oULFak4QA4YLA&s',
        assignment: 'MCQ',
        coursename: 'java full course'),
    User(
        urlAvatar:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Neil_deGrasse_Tyson_in_June_2017_%28cropped%29.jpg/1200px-Neil_deGrasse_Tyson_in_June_2017_%28cropped%29.jpg',
        assignment: 'MCQ',
        coursename: 'Devops'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        shadowColor: Colors.white,
        foregroundColor: Colors.red,
        backgroundColor: themecolor,
        // actions: [
        //   TextButton(
        //     style: TextButton.styleFrom(
        //         backgroundColor: boxtilecolor,
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(8),
        //             side: BorderSide(color: titlecolor))),
        //     onPressed: () {
        //       Get.to(() => Completedassignmentlist());
        //     },
        //     child: Text(
        //       'Done',
        //       style: TextStyle(
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ],
        title: const Text(
          'Multiple choice Question',
          style: TextStyle(color: Colors.amber, fontSize: 18),
        ),
      ),
      body: Container(
        color: backgrounghilghtcolor,
        child: ListView.builder(
            itemCount: user.length,
            itemBuilder: ((context, index) {
              final users = user[index];
              return Card(
                color: boxtilecolor,
                semanticContainer: true,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(users.urlAvatar),
                  ),
                  title: Text(
                    users.coursename,
                    style: const TextStyle(color: titlecolor),
                  ),
                  subtitle: Text(
                    users.assignment,
                    style: const TextStyle(color: featureColor),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.to(() => const MCQcollection());
                  },
                ),
              );
            })),
      ),
    );
  }
}
