import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mindmorph/modules/upload_course/data/repositories/course_section.dart';
import 'package:mindmorph/modules/upload_course/models/course_section/add_section_request.dart';
import 'package:mindmorph/widgets/app_bar.dart';
import 'package:mindmorph/widgets/button.dart';
import 'package:mindmorph/widgets/form_field.dart';
import '../../../models/course_section/upload_lecture.dart';
import '/constants/color.dart';
// ignore: no_leading_underscores_for_library_prefixes
import '.../../../../../data/validators/title_validator.dart' as _validator;
import '../../screens/upload_section.dart';

class AddCourseSection extends StatefulWidget {
  const AddCourseSection({super.key, required this.courseId});
  final int courseId;

  @override
  State<AddCourseSection> createState() => _AddCourseSectionState();
}

class _AddCourseSectionState extends State<AddCourseSection> {
  final _sectionTitleController = TextEditingController();
  FilePickerResult? filesPicked;
  bool? showFolderValidationError;
  final String _errorMessage =
      'Select a folder containing this course section ';
  final _formKey = GlobalKey<FormState>();

  Future<void> _selectFolder() async {
    final pickedFiles = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['vtt', 'srt', 'mp4', 'mkv', 'pdf', 'zip', 'rar'],
    );

    setState(() {
      pickedFiles == null
          ? showFolderValidationError = true
          : filesPicked = pickedFiles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themecolor,
      appBar: const MindMorphAppBar(title: 'Add a Course Section'),
      body: SingleChildScrollView(
        // height: context.screenHeight,
        // width: context.screenWidth,
        padding: const EdgeInsets.all(16),
        // color: themecolor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: MindMorphFormField(
                controller: _sectionTitleController,
                labelText: 'Section Title',
                minLines: 1,
                maxLines: 2,
                validator: _validator.titleValidator,
              ),
            ),
            TextButton(
              onPressed: _selectFolder,
              child: const Text('Choose Files', style: TextStyle(fontSize: 16)),
            ),
            Text(
              showFolderValidationError == true ? _errorMessage : '',
              style: TextStyle(
                  color: showFolderValidationError == true
                      ? Colors.red
                      : Colors.grey,
                  fontSize: 10),
            ),
            const SizedBox(height: 20),
            filesPicked == null
                ? const Text('No files picked')
                : SelectedFilesView(
                    filenames: filesPicked!.names
                        .cast<String>() //.map((file) => file.name).toList()
                    ),
            const SizedBox(height: 20),
            PrimaryButton(
              onTap: () async {
                // Donot proceed if form is invalid
                if (!_formKey.currentState!.validate() || filesPicked == null) {
                  print('Invalid form');
                  return;
                }
                // TODO: Uncomment these validation check & DB save

                // Save section and send section Id
                final data = AddSectionRequestModel(
                  courseId: widget.courseId,
                  title: _sectionTitleController.text.trim(),
                );
                final result = await CourseSectionRepository.addSection(data);

                //Send data to sections page
                //// TODO:
                if (context.mounted) {
                  final lectureFiles = UploadLectureFiles(
                    courseId: widget.courseId,
                    sectionId: result.id,
                    filesPicked: filesPicked!,
                  );
                  // print('Result: ${fdata.toString()}');

                  // Send data to next page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UploadCourseSectionsScreen(
                        sectionId: result.id,
                        courseId:
                            widget.courseId, // TODO: set `widget.courseId`
                        lecturesData: lectureFiles.toLecturesData(),
                      ),
                    ),
                  );
                }

                // Show uploading UI

                // Parallely fetch uploaded sections and show
              },
              labelText: 'PREVIEW',
            )
          ],
        ),
      ),
    );
  }
}

class SelectedFilesView extends StatelessWidget {
  const SelectedFilesView({
    super.key,
    required this.filenames,
  });

  final List<String> filenames;

  String getFilenameWithEmoji(String filename) {
    String ext = filename.split('.').last;

    final output = (ext == 'pdf')
        ? '📕  $filename'
        : (ext == 'mp4' || ext == 'mkv')
            ? '🎬  $filename'
            : (ext == 'rar' || ext == 'zip')
                ? '📁  $filename'
                : (ext == 'srt' || ext == 'vtt')
                    ? '📄  $filename'
                    : filename;
    return output;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (String filename in filenames)
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 10, bottom: 10),
            child: Text(
              getFilenameWithEmoji(filename),
              style: const TextStyle(color: Colors.amber, fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }
}
