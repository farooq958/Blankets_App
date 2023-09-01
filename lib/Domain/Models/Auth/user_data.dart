import 'dart:convert';

class UserData {
  final UserDetails? userDetails;

  UserData({
    this.userDetails,
  });

  factory UserData.fromJson(String str) => UserData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
    userDetails: json["UserDetails"] == null ? null : UserDetails.fromMap(json["UserDetails"]),
  );

  Map<String, dynamic> toMap() => {
    "UserDetails": userDetails?.toMap(),
  };
}

class UserDetails {
  final int? id;
  final String? cardCode;
  final String? cardName;
  final String? cardType;
  final dynamic cardValid;
  final dynamic groupCode;
  final String? phone1;
  final String? address;
  final String? cntctPrsn;
  final double? balance;
  final String? priceList;
  final double? openOrder;
  final String? creditLimit;
  final String? tolerance;
  final String? status;
  final String? loyalty;
  final String? specialDeal;
  final String? property1;
  final String? property2;
  final String? property3;
  final String? ordersBal;
  final String? password;
  final String? cellular;
  final String? remarks;
  final String? area;
  final String? slperson;

  UserDetails({
    this.id,
    this.cardCode,
    this.cardName,
    this.cardType,
    this.cardValid,
    this.groupCode,
    this.phone1,
    this.address,
    this.cntctPrsn,
    this.balance,
    this.priceList,
    this.openOrder,
    this.creditLimit,
    this.tolerance,
    this.status,
    this.loyalty,
    this.specialDeal,
    this.property1,
    this.property2,
    this.property3,
    this.ordersBal,
    this.password,
    this.cellular,
    this.remarks,
    this.area,
    this.slperson,
  });

  factory UserDetails.fromJson(String str) => UserDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDetails.fromMap(Map<String, dynamic> json) => UserDetails(
    id: json["Id"],
    cardCode: json["CardCode"],
    cardName: json["CardName"],
    cardType: json["CardType"],
    cardValid: json["CardValid"],
    groupCode: json["GroupCode"],
    phone1: json["Phone1"],
    address: json["Address"],
    cntctPrsn: json["CntctPrsn"],
    balance: json["Balance"],
    priceList: json["PriceList"],
    openOrder: json["OpenOrder"],
    creditLimit: json["creditLimit"],
    tolerance: json["Tolerance"],
    status: json["Status"],
    loyalty: json["loyalty"],
    specialDeal: json["SpecialDeal"],
    property1: json["Property1"],
    property2: json["Property2"],
    property3: json["Property3"],
    ordersBal: json["OrdersBal"],
    password: json["Password"],
    cellular: json["Cellular"],
    remarks: json["Remarks"],
    area: json["area"],
    slperson: json["Slperson"],
  );

  Map<String, dynamic> toMap() => {
    "Id": id,
    "CardCode": cardCode,
    "CardName": cardName,
    "CardType": cardType,
    "CardValid": cardValid,
    "GroupCode": groupCode,
    "Phone1": phone1,
    "Address": address,
    "CntctPrsn": cntctPrsn,
    "Balance": balance,
    "PriceList": priceList,
    "OpenOrder": openOrder,
    "creditLimit": creditLimit,
    "Tolerance": tolerance,
    "Status": status,
    "loyalty": loyalty,
    "SpecialDeal": specialDeal,
    "Property1": property1,
    "Property2": property2,
    "Property3": property3,
    "OrdersBal": ordersBal,
    "Password": password,
    "Cellular": cellular,
    "Remarks": remarks,
    "area": area,
    "Slperson": slperson,
  };
}
