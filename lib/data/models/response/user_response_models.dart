import 'dart:convert';

class UserProfileResponseModel {
  final String? message;
  final Data? data;

  UserProfileResponseModel({
    this.message,
    this.data,
  });

  factory UserProfileResponseModel.fromJson(String str) =>
      UserProfileResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserProfileResponseModel.fromMap(Map<String, dynamic> json) =>
      UserProfileResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;

  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
      };
}
