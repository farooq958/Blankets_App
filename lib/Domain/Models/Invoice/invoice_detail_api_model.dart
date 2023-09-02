import 'dart:convert';

class InvoiceDetailApiModel {
  final int? id;
  final String? docNum;
  final String? docEntry;
  final String? docDate;
  final String? cardCode;
  final String? cardName;
  final String? docTotal;
  final String? max1099;
  final String? itemCode;
  final String? description;
  final String? inventoryUoM;
  final String? quantity;
  final String? lineTotal;
  final String? price;
  final String? address;
  final String? comments;
  final String? lineNum;
  final String? createdBy;
  final String? contactPer;
  final String? cell;
  final String? salesPerson;
  final String? pStatus;
  final String? packing;
  final String? goodstype;
  final String? invQty;

  InvoiceDetailApiModel({
    this.id,
    this.docNum,
    this.docEntry,
    this.docDate,
    this.cardCode,
    this.cardName,
    this.docTotal,
    this.max1099,
    this.itemCode,
    this.description,
    this.inventoryUoM,
    this.quantity,
    this.lineTotal,
    this.price,
    this.address,
    this.comments,
    this.lineNum,
    this.createdBy,
    this.contactPer,
    this.cell,
    this.salesPerson,
    this.pStatus,
    this.packing,
    this.goodstype,
    this.invQty,
  });

  factory InvoiceDetailApiModel.fromJson(String str) => InvoiceDetailApiModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InvoiceDetailApiModel.fromMap(Map<String, dynamic> json) => InvoiceDetailApiModel(
    id: json["id"],
    docNum: json["DocNum"],
    docEntry: json["DocEntry"],
    docDate: json["DocDate"],
    cardCode: json["CardCode"],
    cardName: json["CardName"],
    docTotal: json["DocTotal"],
    max1099: json["Max1099"],
    itemCode: json["ItemCode"],
    description: json["Description"],
    inventoryUoM: json["InventoryUoM"],
    quantity: json["Quantity"],
    lineTotal: json["LineTotal"],
    price: json["Price"],
    address: json["Address"],
    comments: json["Comments"],
    lineNum: json["LineNum"],
    createdBy: json["CreatedBy"],
    contactPer: json["ContactPer"],
    cell: json["Cell"],
    salesPerson: json["SalesPerson"],
    pStatus: json["PStatus"],
    packing: json["Packing"],
    goodstype: json["Goodstype"],
    invQty: json["InvQty"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "DocNum": docNum,
    "DocEntry": docEntry,
    "DocDate": docDate,
    "CardCode": cardCode,
    "CardName": cardName,
    "DocTotal": docTotal,
    "Max1099": max1099,
    "ItemCode": itemCode,
    "Description": description,
    "InventoryUoM": inventoryUoM,
    "Quantity": quantity,
    "LineTotal": lineTotal,
    "Price": price,
    "Address": address,
    "Comments": comments,
    "LineNum": lineNum,
    "CreatedBy": createdBy,
    "ContactPer": contactPer,
    "Cell": cell,
    "SalesPerson": salesPerson,
    "PStatus": pStatus,
    "Packing": packing,
    "Goodstype": goodstype,
    "InvQty": invQty,
  };
}
