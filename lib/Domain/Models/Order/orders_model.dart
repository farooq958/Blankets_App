// To parse this JSON data, do
//
//     final notificationsModel = notificationsModelFromJson(jsonString);

import 'dart:convert';

OrdersApiModel notificationsModelFromJson(String str) =>
    OrdersApiModel.fromJson(json.decode(str));

String notificationsModelToJson(OrdersApiModel data) =>
    json.encode(data.toJson());

class OrdersApiModel {
  final int? id;
  final String? docnum;
  final String? docEntry;
  final String? cardCode;
  final String? cardName;
  final String? docDate;
  final String? docDueDate;
  final String? docTotal;
  final String? comments;
  final String? confirmed;
  final String? etd;
  final String? status;
  final List<Salesorderdetaila>? salesorderdetailas;

  OrdersApiModel({
    this.id,
    this.docnum,
    this.docEntry,
    this.cardCode,
    this.cardName,
    this.docDate,
    this.docDueDate,
    this.docTotal,
    this.comments,
    this.confirmed,
    this.etd,
    this.status,
    this.salesorderdetailas,
  });

  factory OrdersApiModel.fromJson(Map<String, dynamic> json) => OrdersApiModel(
        id: json["Id"],
        docnum: json["Docnum"],
        docEntry: json["DocEntry"],
        cardCode: json["CardCode"],
        cardName: json["CardName"],
        docDate: json["DocDate"],
        docDueDate: json["DocDueDate"],
        docTotal: json["DocTotal"],
        comments: json["Comments"],
        confirmed: json["Confirmed"],
        etd: json["ETD"],
        status: json["Status"],
        salesorderdetailas: json["salesorderdetailas"] == null
            ? []
            : List<Salesorderdetaila>.from(json["salesorderdetailas"]!
                .map((x) => Salesorderdetaila.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Docnum": docnum,
        "DocEntry": docEntry,
        "CardCode": cardCode,
        "CardName": cardName,
        "DocDate": docDate,
        "DocDueDate": docDueDate,
        "DocTotal": docTotal,
        "Comments": comments,
        "Confirmed": confirmed,
        "ETD": etd,
        "Status": status,
        "salesorderdetailas": salesorderdetailas == null
            ? []
            : List<dynamic>.from(salesorderdetailas!.map((x) => x.toJson())),
      };
}

class Salesorderdetaila {
  final int? id;
  final String? itemCode;
  final String? quantity;
  final String? invQty;
  final String? itemName;
  final String? uomCode;
  final String? uomEntry;
  final String? whsCode;
  final String? vatGroup;
  final String? price;
  final String? lineTotal;

  Salesorderdetaila({
    this.id,
    this.itemCode,
    this.quantity,
    this.invQty,
    this.itemName,
    this.uomCode,
    this.uomEntry,
    this.whsCode,
    this.vatGroup,
    this.price,
    this.lineTotal,
  });

  factory Salesorderdetaila.fromJson(Map<String, dynamic> json) =>
      Salesorderdetaila(
        id: json["Id"],
        itemCode: json["ItemCode"],
        quantity: json["Quantity"],
        invQty: json["InvQty"],
        itemName: json["ItemName"],
        uomCode: json["UomCode"],
        uomEntry: json["UomEntry"],
        whsCode: json["WhsCode"],
        vatGroup: json["VatGroup"],
        price: json["Price"],
        lineTotal: json["LineTotal"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ItemCode": itemCode,
        "Quantity": quantity,
        "InvQty": invQty,
        "ItemName": itemName,
        "UomCode": uomCode,
        "UomEntry": uomEntry,
        "WhsCode": whsCode,
        "VatGroup": vatGroup,
        "Price": price,
        "LineTotal": lineTotal,
      };
}
