import 'dart:convert';

class AuthResponseModels {
  final String message;
  final String jwtToken;
  final Data data;

  AuthResponseModels({
    required this.message,
    required this.jwtToken,
    required this.data,
  });

  factory AuthResponseModels.fromJson(String str) =>
      AuthResponseModels.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModels.fromMap(Map<String, dynamic> json) =>
      AuthResponseModels(
        message: json["message"],
        jwtToken: json["jwt-token"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "jwt-token": jwtToken,
        "data": data.toMap(),
      };
}

class Data {
  final int id;
  final String name;
  final String email;
  final String phone;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
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
