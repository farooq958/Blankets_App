import 'dart:convert';

class OrderDbModel {
  final String? productId;
  final String? productName;
  final String? productQuantity;
  final String? productDateTime;

  OrderDbModel({
    this.productId,
    this.productName,
    this.productQuantity,
    this.productDateTime,
  });

  factory OrderDbModel.fromJson(String str) =>
      OrderDbModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDbModel.fromMap(Map<String, dynamic> json) => OrderDbModel(
        productId: json["productId"],
        productName: json["productName"],
        productQuantity: json["productQuantity"],
        productDateTime: json["productDateTime"],
      );

  Map<String, dynamic> toMap() => {
        "productId": productId,
        "productName": productName,
        "productQuantity": productQuantity,
        "productDateTime": productDateTime,
      };
}
