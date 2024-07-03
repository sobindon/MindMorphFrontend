class UserStorageModel {
  String fullName, email, avatar, role, token;
  bool? isLogin;
  int userId;

  UserStorageModel(
      {required this.fullName,
      required this.email,
      required this.avatar,
      required this.role,
      this.isLogin,
      required this.userId,
      required this.token});

  factory UserStorageModel.fromJson(Map<String, dynamic> json) =>
      UserStorageModel(
        fullName: json["fullName"],
        email: json["email"],
        userId: json["userId"],
        avatar: json["avatar"],
        role: json["role"],
        token: json["token"],
      );

  // Map<String, dynamic> toJson() => {
  //       "fullName": fullName,
  //       "email": email,
  //       "userId": userId,
  //       "avatar": avatar,
  //       "role": role,
  //     };
}

// String userStorageToJson(UserStorageModel data) => json.encode(data.toJson());

// UserStorageModel userStorageFromJson(String str) =>
//     UserStorageModel.fromJson(json.decode(str));
