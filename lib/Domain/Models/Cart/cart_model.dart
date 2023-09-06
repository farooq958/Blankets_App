import 'dart:convert';

class CartModel {
  final String? productId;
  final String? productImage;
  final String? productName;
  final String? productPrice;
  final String? pcsCtn;
  final String?  productQuantity;
  final String? multiplier;

  CartModel( {
    this.productId,this.productQuantity,
    this.productImage,
    this.productName,
    this.productPrice,
    this.pcsCtn,this.multiplier,
  });

  factory CartModel.fromJson(String str) => CartModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartModel.fromMap(Map<String, dynamic> json) => CartModel(
    productId: json["productId"],
    productImage: json["productImage"],
    productName: json["productName"],
    productPrice: json["productPrice"],
    pcsCtn: json["pcs/ctn"],
    productQuantity: json["productQuantity"],
    multiplier: json['multiplier']
  );

  Map<String, dynamic> toMap() => {
    "productId": productId,
    "productImage": productImage,
    "productName": productName,
    "productPrice": productPrice,
    "pcsCtn": pcsCtn,
    "productQuantity":productQuantity,
    'multiplier':multiplier
  };
}
