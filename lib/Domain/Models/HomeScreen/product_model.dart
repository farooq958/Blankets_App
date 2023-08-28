
import 'dart:convert';
class ProductModel {
  final String? productId;
  final String? productName;
  final String? productImage;
  final String? productPrice;
  final String? productDescription;

  ProductModel({
    this.productId,
    this.productName,
    this.productImage,
    this.productPrice,
    this.productDescription,
  });

}




class ProductApiModel {
  final String? itemCode;
  final String? itemName;
  final String? uPacking;
  final String? invntryUom;
  final String? price;
  final String? defaultSalesUom;
  final String? priceList;
  final String? multiplier;
  final String? uImage;
  final String? uGoodstype;
  final String? attachment;
  final int? rowId;
  final String? catId;
  final String? cat;
  final String? qryGroup1;
  final String? qryGroup2;
  final String? qryGroup3;
  final String? qryGroup4;
  final String? qryGroup5;
  final String? qryGroup6;
  final String? qryGroup7;
  final String? qryGroup8;
  final String? qryGroup9;
  final String? qryGroup10;
  final String? qryGroup11;
  final String? qryGroup12;
  final String? qryGroup13;
  final String? qryGroup14;
  final String? qryGroup15;
  final String? qryGroup16;
  final String? qryGroup17;
  final String? qryGroup18;
  final String? qryGroup19;
  final String? qryGroup20;
  final String? qryGroup21;
  final String? qryGroup22;
  final String? qryGroup23;
  final String? qryGroup24;
  final String? qryGroup25;
  final int? oitmId;

  ProductApiModel({
    this.itemCode,
    this.itemName,
    this.uPacking,
    this.invntryUom,
    this.price,
    this.defaultSalesUom,
    this.priceList,
    this.multiplier,
    this.uImage,
    this.uGoodstype,
    this.attachment,
    this.rowId,
    this.catId,
    this.cat,
    this.qryGroup1,
    this.qryGroup2,
    this.qryGroup3,
    this.qryGroup4,
    this.qryGroup5,
    this.qryGroup6,
    this.qryGroup7,
    this.qryGroup8,
    this.qryGroup9,
    this.qryGroup10,
    this.qryGroup11,
    this.qryGroup12,
    this.qryGroup13,
    this.qryGroup14,
    this.qryGroup15,
    this.qryGroup16,
    this.qryGroup17,
    this.qryGroup18,
    this.qryGroup19,
    this.qryGroup20,
    this.qryGroup21,
    this.qryGroup22,
    this.qryGroup23,
    this.qryGroup24,
    this.qryGroup25,
    this.oitmId,
  });

  factory ProductApiModel.fromJson(String str) => ProductApiModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductApiModel.fromMap(Map<String, dynamic> json) => ProductApiModel(
    itemCode: json["ItemCode"],
    itemName: json["ItemName"],
    uPacking: json["U_PACKING"],
    invntryUom: json["InvntryUom"],
    price: json["Price"],
    defaultSalesUom: json["DefaultSalesUOM"],
    priceList: json["PriceList"],
    multiplier: json["Multiplier"],
    uImage: json["U_Image"],
    uGoodstype: json["U_GOODSTYPE"],
    attachment: json["attachment"],
    rowId: json["row_Id"],
    catId: json["Cat_ID"],
    cat: json["Cat"],
    qryGroup1: json["QryGroup1"],
    qryGroup2: json["QryGroup2"],
    qryGroup3: json["QryGroup3"],
    qryGroup4: json["QryGroup4"],
    qryGroup5: json["QryGroup5"],
    qryGroup6: json["QryGroup6"],
    qryGroup7: json["QryGroup7"],
    qryGroup8: json["QryGroup8"],
    qryGroup9: json["QryGroup9"],
    qryGroup10: json["QryGroup10"],
    qryGroup11: json["QryGroup11"],
    qryGroup12: json["QryGroup12"],
    qryGroup13: json["QryGroup13"],
    qryGroup14: json["QryGroup14"],
    qryGroup15: json["QryGroup15"],
    qryGroup16: json["QryGroup16"],
    qryGroup17: json["QryGroup17"],
    qryGroup18: json["QryGroup18"],
    qryGroup19: json["QryGroup19"],
    qryGroup20: json["QryGroup20"],
    qryGroup21: json["QryGroup21"],
    qryGroup22: json["QryGroup22"],
    qryGroup23: json["QryGroup23"],
    qryGroup24: json["QryGroup24"],
    qryGroup25: json["QryGroup25"],
    oitmId: json["OITM_Id"],
  );

  Map<String, dynamic> toMap() => {
    "ItemCode": itemCode,
    "ItemName": itemName,
    "U_PACKING": uPacking,
    "InvntryUom": invntryUom,
    "Price": price,
    "DefaultSalesUOM": defaultSalesUom,
    "PriceList": priceList,
    "Multiplier": multiplier,
    "U_Image": uImage,
    "U_GOODSTYPE": uGoodstype,
    "attachment": attachment,
    "row_Id": rowId,
    "Cat_ID": catId,
    "Cat": cat,
    "QryGroup1": qryGroup1,
    "QryGroup2": qryGroup2,
    "QryGroup3": qryGroup3,
    "QryGroup4": qryGroup4,
    "QryGroup5": qryGroup5,
    "QryGroup6": qryGroup6,
    "QryGroup7": qryGroup7,
    "QryGroup8": qryGroup8,
    "QryGroup9": qryGroup9,
    "QryGroup10": qryGroup10,
    "QryGroup11": qryGroup11,
    "QryGroup12": qryGroup12,
    "QryGroup13": qryGroup13,
    "QryGroup14": qryGroup14,
    "QryGroup15": qryGroup15,
    "QryGroup16": qryGroup16,
    "QryGroup17": qryGroup17,
    "QryGroup18": qryGroup18,
    "QryGroup19": qryGroup19,
    "QryGroup20": qryGroup20,
    "QryGroup21": qryGroup21,
    "QryGroup22": qryGroup22,
    "QryGroup23": qryGroup23,
    "QryGroup24": qryGroup24,
    "QryGroup25": qryGroup25,
    "OITM_Id": oitmId,
  };
}



