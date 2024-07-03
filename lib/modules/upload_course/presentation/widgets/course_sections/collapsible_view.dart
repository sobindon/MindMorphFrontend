// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:mindmorph/constants/constants.dart';
import 'package:mindmorph/constants/urls.dart';
import 'package:mindmorph/utils/get_formated_time.dart';
import 'package:mindmorph/widgets/video_player.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../models/course_section/section_preview_response.dart';

class CollapsibleView extends StatefulWidget {
  const CollapsibleView({super.key, required this.section});

  final CourseSectionResponseModel section;

  @override
  State<CollapsibleView> createState() => _CollapsibleViewState();
}

class _CollapsibleViewState extends State<CollapsibleView> {
  final controller = ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      maintainState: true,
      controller: controller,
      title: Text(
        widget.section.title,
        style: const TextStyle(color: Vx.amber100),
      ),
      children: <Widget>[
        Container(
          // width: double.infinity,
          color: backgrounghilghtcolor,
          child: ListView.builder(
            shrinkWrap:
                true, // This allows the ListView to be sized to its content
            physics:
                const NeverScrollableScrollPhysics(), // Prevents scrolling inside the nested ListView
            itemCount: widget.section.lectures.length,
            itemBuilder: ((context, index) {
              final lecture = widget.section.lectures[index];
              return ListTile(
                title: Text(
                  lecture.title,
                  style: const TextStyle(color: titlecolor),
                ),
                subtitle: Text(
                  getFormatedTime(seconds: lecture.duration),
                  style: const TextStyle(color: featureColor),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  final String playlistUrl =
                      'http://$COURSE_SERVER/${lecture.file}';

                  // VideoPlayerData(url:playlistUrl);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MindMorphVideoPlayer(videoUrl: playlistUrl),
                    ),
                  );
                },
              );
            }),
          ),
        ),
      ],
    );
  }
}
