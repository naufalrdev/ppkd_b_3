// To parse this JSON data, do
//
//     final registUserModel = registUserModelFromJson(jsonString);

import 'dart:convert';

RegistUserModel registUserModelFromJson(String str) =>
    RegistUserModel.fromJson(json.decode(str));

String registUserModelToJson(RegistUserModel data) =>
    json.encode(data.toJson());

class RegistUserModel {
  String message;
  RegisterData data;

  RegistUserModel({required this.message, required this.data});

  factory RegistUserModel.fromJson(Map<String, dynamic> json) =>
      RegistUserModel(
        message: json["message"],
        data: RegisterData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {"message": message, "data": data.toJson()};
}

class RegisterData {
  String token;
  User user;

  RegisterData({required this.token, required this.user});

  factory RegisterData.fromJson(Map<String, dynamic> json) =>
      RegisterData(token: json["token"], user: User.fromJson(json["user"]));

  Map<String, dynamic> toJson() => {"token": token, "user": user.toJson()};
}

class User {
  String name;
  String email;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  User({
    required this.name,
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
