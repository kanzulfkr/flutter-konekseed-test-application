import 'dart:convert';

class BusinessResponseModel {
  final String message;
  final List<Data> data;

  BusinessResponseModel({
    required this.message,
    required this.data,
  });

  factory BusinessResponseModel.fromJson(String str) =>
      BusinessResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BusinessResponseModel.fromMap(Map<String, dynamic> json) =>
      BusinessResponseModel(
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Data {
  final int id;
  final int userId;
  final String owner;
  final String name;
  final String logo;
  final String sector;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.id,
    required this.userId,
    required this.owner,
    required this.name,
    required this.logo,
    required this.sector,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? 0,
        owner: json["owner"] ?? "",
        name: json["name"] ?? "",
        logo: json["logo"] ?? "",
        sector: json["sector"] ?? "",
        status: json["status"] ?? "",
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : DateTime.now(),
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : DateTime.now(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "owner": owner,
        "name": name,
        "logo": logo,
        "sector": sector,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
