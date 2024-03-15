import 'dart:convert';

class UpdateTargetRequestModel {
  final String id;
  final String businessId;
  final String productId;
  final String name;
  final String category;
  final String weight;
  final String startDate;
  final String endDate;
  final String status;

  UpdateTargetRequestModel({
    required this.id,
    required this.businessId,
    required this.productId,
    required this.name,
    required this.category,
    required this.weight,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  factory UpdateTargetRequestModel.fromJson(String str) =>
      UpdateTargetRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateTargetRequestModel.fromMap(Map<String, dynamic> json) {
    return UpdateTargetRequestModel(
      id: json["id"] ?? "",
      businessId: json["business_id"] ?? "",
      productId: json["product_id"] ?? "",
      name: json["name"] ?? "",
      category: json["category"] ?? "",
      weight: json["weight"] ?? "",
      startDate: json["start_date"] ?? "",
      endDate: json["end_date"] ?? "",
      status: json["status"] ?? "",
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "business_id": businessId,
        "product_id": productId,
        "name": name,
        "category": category,
        "weight": weight,
        "start_date": startDate,
        "end_date": endDate,
        "status": status,
      };
}
