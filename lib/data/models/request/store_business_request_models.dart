import 'dart:convert';

class StoreBusinessRequestModel {
  final String name;
  final String userId;
  final String logo;
  final String sector;
  final String status;

  StoreBusinessRequestModel({
    required this.name,
    required this.userId,
    required this.logo,
    required this.sector,
    required this.status,
  });

  factory StoreBusinessRequestModel.fromJson(String str) =>
      StoreBusinessRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StoreBusinessRequestModel.fromMap(Map<String, dynamic> json) {
    return StoreBusinessRequestModel(
      name: json["name"] ?? "",
      userId: json["userId"] ?? "",
      logo: json["logo"] ?? "",
      sector: json["sector"] ?? "",
      status: json["status"] ?? "",
    );
  }

  Map<String, dynamic> toMap() => {
        "name": name,
        "user_id": userId,
        "logo": logo,
        "sector": sector,
        "status": status,
      };
}
