import 'dart:convert';

class DashboardModel {
  final int? id;
  final String? cardCode;
  final String? cardName;
  final String? creditLine;
  final String? sales;
  final String? cr;
  final String? netSales;
  final String? status;
  final String? loyal;
  final String? loyalReward;
  final String? reward;
  final String? percentage;
  final String? nextSales;
  final String? nextStatus;
  final String? totalReward;

  DashboardModel({
    this.id,
    this.cardCode,
    this.cardName,
    this.creditLine,
    this.sales,
    this.cr,
    this.netSales,
    this.status,
    this.loyal,
    this.loyalReward,
    this.reward,
    this.percentage,
    this.nextSales,
    this.nextStatus,
    this.totalReward,
  });

  factory DashboardModel.fromJson(String str) => DashboardModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DashboardModel.fromMap(Map<String, dynamic> json) => DashboardModel(
    id: json["id"],
    cardCode: json["CardCode"],
    cardName: json["CardName"],
    creditLine: json["CreditLine"],
    sales: json["Sales"],
    cr: json["CR"],
    netSales: json["NetSales"],
    status: json["Status"],
    loyal: json["Loyal"],
    loyalReward: json["LoyalReward"],
    reward: json["Reward"],
    percentage: json["percentage"],
    nextSales: json["NextSales"],
    nextStatus: json["NextStatus"],
    totalReward: json["TotalReward"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "CardCode": cardCode,
    "CardName": cardName,
    "CreditLine": creditLine,
    "Sales": sales,
    "CR": cr,
    "NetSales": netSales,
    "Status": status,
    "Loyal": loyal,
    "LoyalReward": loyalReward,
    "Reward": reward,
    "percentage": percentage,
    "NextSales": nextSales,
    "NextStatus": nextStatus,
    "TotalReward": totalReward,
  };
}
