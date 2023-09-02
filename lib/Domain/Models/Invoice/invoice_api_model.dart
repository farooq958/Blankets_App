import 'dart:convert';

class InvoiceApiModel {
  final int? id;
  final String? cardCode;
  final String? cardName;
  final String? postingDate;
  final String? docNum;
  final String? docEntry;
  final String? docTotal;
  final String? max1099;
  final String? sumofSalesQuantities;
  final String? sumofInvQtyonInvoice;

  InvoiceApiModel({
    this.id,
    this.cardCode,
    this.cardName,
    this.postingDate,
    this.docNum,
    this.docEntry,
    this.docTotal,
    this.max1099,
    this.sumofSalesQuantities,
    this.sumofInvQtyonInvoice,
  });

  factory InvoiceApiModel.fromJson(String str) => InvoiceApiModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InvoiceApiModel.fromMap(Map<String, dynamic> json) => InvoiceApiModel(
    id: json["Id"],
    cardCode: json["CardCode"],
    cardName: json["CardName"],
    postingDate: json["PostingDate"],
    docNum: json["DocNum"],
    docEntry: json["DocEntry"],
    docTotal: json["DocTotal"],
    max1099: json["Max1099"],
    sumofSalesQuantities: json["SumofSalesQuantities"],
    sumofInvQtyonInvoice: json["SumofInvQtyonInvoice"],
  );

  Map<String, dynamic> toMap() => {
    "Id": id,
    "CardCode": cardCode,
    "CardName": cardName,
    "PostingDate": postingDate,
    "DocNum": docNum,
    "DocEntry": docEntry,
    "DocTotal": docTotal,
    "Max1099": max1099,
    "SumofSalesQuantities": sumofSalesQuantities,
    "SumofInvQtyonInvoice": sumofInvQtyonInvoice,
  };
}
