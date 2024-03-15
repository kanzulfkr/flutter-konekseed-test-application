import 'dart:convert';

class ProductResponseModel {
  final String message;
  final List<Data> data;

  ProductResponseModel({
    required this.message,
    required this.data,
  });

  factory ProductResponseModel.fromJson(String str) =>
      ProductResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductResponseModel.fromMap(Map<String, dynamic> json) =>
      ProductResponseModel(
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
  final String name;
  final String description;
  final int price;
  final int quantity;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        description: json["description"] ?? "",
        price: json["price"] ?? 0,
        quantity: json["quantity"] ?? 0,
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : DateTime.now(),
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : DateTime.now(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "quantity": quantity,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
