import 'dart:convert';

class StatementApiModel {
  final int? id;
  final String? shortName;
  final String? refDate;
  final String? transId;
  final String? transType;
  final String? ref1;
  final String? source;
  final String? lineMemo;
  final String? debit;
  final String? credit;
  final String? runningTotal;

  StatementApiModel({
    this.id,
    this.shortName,
    this.refDate,
    this.transId,
    this.transType,
    this.ref1,
    this.source,
    this.lineMemo,
    this.debit,
    this.credit,
    this.runningTotal,
  });

  factory StatementApiModel.fromJson(String str) => StatementApiModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StatementApiModel.fromMap(Map<String, dynamic> json) => StatementApiModel(
    id: json["id"],
    shortName: json["ShortName"],
    refDate: json["RefDate"],
    transId: json["TransId"],
    transType: json["TransType"],
    ref1: json["Ref1"],
    source: json["Source"],
    lineMemo: json["LineMemo"],
    debit: json["Debit"],
    credit: json["Credit"],
    runningTotal: json["RunningTotal"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "ShortName": shortName,
    "RefDate": refDate,
    "TransId": transId,
    "TransType": transType,
    "Ref1": ref1,
    "Source": source,
    "LineMemo": lineMemo,
    "Debit": debit,
    "Credit": credit,
    "RunningTotal": runningTotal,
  };
}
