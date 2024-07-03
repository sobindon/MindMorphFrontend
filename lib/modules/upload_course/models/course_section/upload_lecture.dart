// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class UploadLectureFiles {
  FilePickerResult filesPicked;
  int courseId;
  String sectionId;
  UploadLectureFiles({
    required this.filesPicked,
    required this.courseId,
    required this.sectionId,
  });

  List<UploadLectureData> toLecturesData() {
    List<PlatformFile> files = filesPicked.files;
    Map<int, UploadLectureData> data = {};

    for (PlatformFile file in files) {
      String ext = file.extension!;
      List<String> fileNameData = file.name.split('.');
      int id = int.parse(fileNameData[0]);
      String fileName = fileNameData[1].trim();

      File fileData = File(file.path!);

      if (ext == 'mp4' || ext == 'mkv') {
        data[id] = UploadLectureData(
            courseId: courseId,
            sectionId: sectionId,
            file: fileData,
            fileName: fileName,
            subtitles: [],
            id: id);
      } else if (ext == 'vtt' || ext == 'srt') {
        if (data.containsKey(id)) {
          data[id]!
              .subtitles!
              .add(Subtitle(file: fileData, language: fileName.capitalized));
        } else {
          data[id] = UploadLectureData(
              courseId: courseId,
              sectionId: sectionId,
              subtitles: [
                Subtitle(file: fileData, language: fileName.capitalized)
              ]);
        }
      } else if (ext == 'pdf' || ext == 'zip' || ext == 'rar') {
        data[id] = UploadLectureData(
            courseId: courseId,
            sectionId: sectionId,
            isAttachment: true,
            file: fileData,
            fileName: fileName);
      }
    }

    return data.values.toList();
  }

  // @override
  // String toString() {
  //   final data = toLecturesData();
  //   print('\n\n\nxxxxxxxxxxxxxxxxxxxxxxxx');
  //   data.forEach((key, value) {
  //     print('\nid: $key  =>  ${value.toString()}');
  //   });
  //   return '\n\n\nCourse id: $courseId \nsection Id: $sectionId\n\n';
  // }
}

class UploadLectureData {
  int courseId;
  String sectionId;
  String? fileName;
  List<Subtitle>? subtitles;
  int? status;
  int? id;
  bool? isAttachment;
  File? file;
  UploadLectureData({
    required this.courseId,
    required this.sectionId,
    this.fileName,
    this.subtitles,
    this.status,
    this.id,
    this.isAttachment,
    this.file,
  });

  bool get isUploading {
    return status == -1;
  }

  bool get isUploadFailure {
    return status == 0;
  }

  bool get isUploadSuccess {
    return status == 1;
  }

  String get subtitlesNames {
    if (subtitles == null || subtitles!.isEmpty) return '';
    String subtitlesNamesData = '';
    for (Subtitle subtitle in subtitles!) {
      subtitlesNamesData += '  📄  ${subtitle.language}\n';
    }
    return subtitlesNamesData;
  }

  // @override
  // String toString() {
  //   return 'UploadLectureData{'
  //       'fileName: $fileName, '
  //       'subtitles: $subtitles, '
  //       'status: $status, '
  //       'id: $id, '
  //       'isAttachment: $isAttachment, '
  //       'file: $file}';
  // }

  //Upload schema
  Map<String, String> get fields {
    final fieldsData = {
      'courseId': courseId.toString(),
      'sectionId': sectionId,
      'title': fileName!
    };
    if (isAttachment == true) {
      fieldsData['isAttachment'] = isAttachment.toString();
    }
    return fieldsData;
  }

  Future<List<http.MultipartFile>> get files async {
    final filesData = [
      await http.MultipartFile.fromPath('file', file!.path),
    ];
    if (subtitles == null) return filesData;
    for (Subtitle s in subtitles!) {
      filesData
          .add(await http.MultipartFile.fromPath('subtitles', s.file.path));
    }
    return filesData;
  }
}

class Subtitle {
  File file;
  String language;
  Subtitle({
    required this.file,
    required this.language,
  });
  @override
  String toString() {
    return 'Subtitle{file: $file, language: $language}';
  }
}
