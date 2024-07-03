import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'form_controller.dart';

class FilePickerButton extends StatefulWidget {
  const FilePickerButton(
      {super.key,
      required this.labelText,
      required this.type,
      required this.controller});
  final String labelText;
  final FileType type;
  final CreateCourseFormController controller;

  @override
  State<FilePickerButton> createState() => _FilePickerButtonState();
}

class _FilePickerButtonState extends State<FilePickerButton> {
  File? file;
  String? fileName;

  Future<void> _getFile(FileType type) async {
    final result = await FilePicker.platform.pickFiles(type: type);
    if (result != null) {
      List<PlatformFile> files = result.files;

      setState(() {
        if (files.isNotEmpty && files.first.path != null) {
          file = File(files.first.path!);
          if (widget.type == FileType.image) {
            widget.controller.setThumbnail(file);
          } else {
            widget.controller.setTitleVideo(file);
          }
        }
        fileName = files.first.name;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final labelText =
        fileName == null ? widget.labelText : 'Change ${widget.labelText}';
    final validationText = '${widget.labelText} is Required';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () async => await _getFile(widget.type),
          child: Text(labelText, style: const TextStyle(fontSize: 16)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 0, bottom: 10),
          child: Text(
            fileName ?? '',
            style: const TextStyle(
                color: Color.fromARGB(255, 113, 108, 107), fontSize: 10),
          ),
        ),
        file == null
            ? Text(
                validationText,
                style: const TextStyle(
                    color: Color.fromARGB(255, 247, 13, 28), fontSize: 10),
              )
            : widget.type == FileType.image
                ? Image.file(
                    file!,
                    height: 150,
                  )
                : BetterPlayer.file(
                    file!.path,
                    betterPlayerConfiguration: const BetterPlayerConfiguration(
                      // aspectRatio: 16 / 9,
                      autoPlay: false,
                    ),
                  ),
      ],
    );
  }
}
