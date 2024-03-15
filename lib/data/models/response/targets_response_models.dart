import 'dart:convert';

class TargetsResponseModel {
  final String message;
  final List<Data> data;

  TargetsResponseModel({
    required this.message,
    required this.data,
  });

  factory TargetsResponseModel.fromJson(String str) =>
      TargetsResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TargetsResponseModel.fromMap(Map<String, dynamic> json) =>
      TargetsResponseModel(
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Data {
  final String businessName;
  final String productName;
  final int id;
  final String name;
  final int businessId;
  final int productId;
  final String category;
  final int weight;
  final DateTime startDate;
  final DateTime endDate;
  final String status;

  Data({
    required this.businessName,
    required this.productName,
    required this.id,
    required this.name,
    required this.businessId,
    required this.productId,
    required this.category,
    required this.weight,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        businessName: json["business_name"],
        productName: json["product_name"],
        id: json["id"],
        name: json["name"],
        businessId: json["business_id"],
        productId: json["product_id"],
        category: json["category"],
        weight: json["weight"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "business_name": businessName,
        "product_name": productName,
        "id": id,
        "name": name,
        "business_id": businessId,
        "product_id": productId,
        "category": category,
        "weight": weight,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "status": status,
      };
}
