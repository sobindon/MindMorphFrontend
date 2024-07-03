import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mindmorph/widgets/secondary_button.dart';
import 'package:mindmorph/widgets/snackbar.dart';
// import '../../../../../widgets/secondary_button.dart';
import '../../../data/repositories/course_section.dart';
import '../../../models/course_section/upload_lecture.dart';
import '/constants/color.dart';
import 'package:velocity_x/velocity_x.dart';

// class Uploadprogress extends StatefulWidget {
//   const Uploadprogress({super.key});

//   @override
//   State<Uploadprogress> createState() => _PreViewCourseState();
// }

// class _PreViewCourseState extends State<Uploadprogress> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: themecolor,
//         iconTheme: const IconThemeData(color: featureColor),
//       ),
//       body: UploadProgressView(),
//     );
//   }
// }

class UploadProgressView extends StatefulWidget {
  const UploadProgressView(
      {super.key,
      required this.sectionId,
      required this.courseId,
      required this.lecturesData});
  final String sectionId;
  final int courseId;
  final List<UploadLectureData> lecturesData;

  @override
  State<UploadProgressView> createState() => _UploadProgressViewState();
}

class _UploadProgressViewState extends State<UploadProgressView> {
  bool isUploadStart = false;
  String submitButtonText = 'Upload';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight,
      width: context.screenWidth,
      color: themecolor,
      child: Column(
        children: [
          10.heightBox,
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.98,
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: BoxDecoration(
              color: boxtilecolor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Expanded(
              child: UploadingProgressView(lecturesData: widget.lecturesData),
            ),
          ),
          10.heightBox,
          MindMorphSecondaryButton(
            labelText: submitButtonText, //Go to Sections
            width: 200,
            onTap: () async {
              setState(() {
                submitButtonText = 'Uploading';
              });
              // Start Uploading
              for (int i = 0; i < widget.lecturesData.length; i++) {
                final lecture = widget.lecturesData[i];
                setState(() {
                  lecture.status = -1;
                });
                bool isUploadSuccess =
                    await CourseSectionRepository.uploadLecture(lecture);
                setState(() {
                  lecture.status = isUploadSuccess ? 1 : 0;
                });
              }
              if (context.mounted) {
                mindMorphSnackBar(
                    context: context,
                    message:
                        'Section files Uploaded. Navigating to Sections List');
              }
              setState(() {
                submitButtonText = 'Uploading';
              });
              if (context.mounted) {
                context.go('/course/sections/${widget.courseId}');
              }
            },
            // onTap: () {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => ListInstructorCourse()));
            // },
          ),
        ],
      ),
    );
  }
}

class UploadingProgressView extends StatelessWidget {
  const UploadingProgressView({super.key, required this.lecturesData});

  final List<UploadLectureData> lecturesData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lecturesData.length,
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          final lecture = lecturesData[index];

          return ListTile(
            leading: Icon(
              lecture.isAttachment == null
                  ? Icons.smart_display
                  : Icons.attachment,
              color: Colors.blueGrey,
            ),
            title: Text(
              lecture.fileName!,
              style: const TextStyle(color: Colors.amber, fontSize: 14),
            ),
            subtitle: Text(lecture.subtitlesNames),
            trailing: Icon(lecture.isUploading
                ? Icons.hourglass_top
                : lecture.isUploadSuccess
                    ? Icons.check_circle
                    : lecture.isUploadFailure
                        ? Icons.close
                        : Icons.pending),
            iconColor: lecture.isUploading
                ? Colors.blue
                : lecture.isUploadSuccess
                    ? Colors.green
                    : lecture.isUploadFailure
                        ? Colors.red
                        : Colors.blueGrey,
          );
        }));
  }
}
