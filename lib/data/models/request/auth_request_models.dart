import 'dart:convert';

class AuthRequestModels {
  final String email;
  final String password;

  AuthRequestModels({
    required this.email,
    required this.password,
  });

  factory AuthRequestModels.fromJson(String str) =>
      AuthRequestModels.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthRequestModels.fromMap(Map<String, dynamic> json) =>
      AuthRequestModels(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
      };
}
