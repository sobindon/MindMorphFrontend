import 'dart:convert';

import '../../auth/login/data/local_storage/user_storage.dart';

class AddToCartRequestModel {
  int courseId;

  AddToCartRequestModel({required this.courseId});

  Future<Map<String, dynamic>> _toJson() async => {
        "courseId": courseId,
        "userId": await UserStorage.userId,
      };

  Future<String> toRequestBody() async => json.encode(await _toJson());
}
