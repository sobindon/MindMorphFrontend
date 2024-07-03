import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mindmorph/widgets/loading_indicator.dart';
import 'package:mindmorph/widgets/snackbar.dart';
import '../../../data/repositories/course_create.dart';
import '../../../models/course_create/request_model.dart';
import 'form_controller.dart';
import '/widgets/button.dart';
import '/widgets/form_field.dart';
import '/modules/upload_course/data/validators/create_course_validators/create_course_validators.dart';
import 'file_picker_button.dart';

class CreateCourseForm extends StatefulWidget {
  const CreateCourseForm({
    super.key,
    required this.courseId,
  });

  final int courseId;

  @override
  State<CreateCourseForm> createState() => _CreateCourseFormState();
}

class _CreateCourseFormState extends State<CreateCourseForm> {
  final _controller = CreateCourseFormController();

  final _formKey = GlobalKey<FormState>();
  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return isSubmitting
        ? const MindMorphLoadingIndicator()
        : SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MindMorphFormField(
                    controller: _controller.title,
                    labelText: 'Title',
                    validator: courseTitleValidator,
                    maxLines: 2,
                    minLines: 1,
                  ),
                  MindMorphFormField(
                    controller: _controller.description,
                    labelText: 'Description',
                    validator: courseDescriptionValidator,
                    keyboardType: TextInputType.multiline,
                  ),
                  MindMorphFormField(
                    controller: _controller.requirements,
                    labelText: 'Requirements',
                    validator: courseRequirementValidator,
                    keyboardType: TextInputType.multiline,
                  ),
                  MindMorphFormField(
                    controller: _controller.objectives,
                    labelText: 'Objectives',
                    validator: courseObjectiveValidator,
                    keyboardType: TextInputType.multiline,
                  ),
                  FilePickerButton(
                    labelText: 'Thumbnail',
                    type: FileType.image,
                    controller: _controller,
                  ),
                  FilePickerButton(
                    labelText: 'Title Video',
                    type: FileType.video,
                    controller: _controller,
                  ),
                  const SizedBox(height: 30),
                  PrimaryButton(
                    labelText: 'NEXT',
                    onTap: () async {
                      // Donot proceed if form is invalid
                      if (!_formKey.currentState!.validate() ||
                          _controller.thumbnail == null ||
                          _controller.titleVideo == null) {
                        if (context.mounted) {
                          mindMorphSnackBar(
                              context: context,
                              message: 'Invalid Form',
                              isError: true);
                        }
                        return;
                      }

                      // Proceed to save
                      final data = CourseCreateRequestModel(
                        courseId: widget.courseId,
                        courseThumbnail: _controller.thumbnail!,
                        description: _controller.description.text.trim(),
                        objective: _controller.objectives.text.trim(),
                        requirement: _controller.requirements.text.trim(),
                        title: _controller.title.text.trim(),
                        titleVideo: _controller.titleVideo!,
                      );

                      //Send to Backend
                      final result = await CourseCreateRepository.submit(data);

                      // Show Result in Snackbar
                      if (context.mounted) {
                        mindMorphSnackBar(
                            context: context, message: result.message);
                      }

                      // Goto next Page
                      if (result.success) {
                        if (context.mounted) {
                          // context.push('/course/add_section/${widget.courseId}');
                          context.go('/course/sections/${widget.courseId}');
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          );
  }
}
