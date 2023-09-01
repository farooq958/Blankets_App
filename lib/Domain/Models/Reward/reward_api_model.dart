import 'dart:convert';

class RewardApiModel {
  final int? id;
  final String? cardCode;
  final String? cardName;
  final String? creditLine;
  final String? sales;
  final String? cr;
  final String? netSales;
  final String? status;
  final String? percentage;
  final String? reward;
  final String? loyal;
  final String? loyalReward;
  final String? startDate;
  final String? endDate;

  RewardApiModel({
    this.id,
    this.cardCode,
    this.cardName,
    this.creditLine,
    this.sales,
    this.cr,
    this.netSales,
    this.status,
    this.percentage,
    this.reward,
    this.loyal,
    this.loyalReward,
    this.startDate,
    this.endDate,
  });

  factory RewardApiModel.fromJson(String str) => RewardApiModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RewardApiModel.fromMap(Map<String, dynamic> json) => RewardApiModel(
    id: json["id"],
    cardCode: json["CardCode"],
    cardName: json["CardName"],
    creditLine: json["CreditLine"],
    sales: json["Sales"],
    cr: json["CR"],
    netSales: json["NetSales"],
    status: json["Status"],
    percentage: json["Percentage"],
    reward: json["Reward"],
    loyal: json["Loyal"],
    loyalReward: json["LoyalReward"],
    startDate: json["StartDate"],
    endDate: json["EndDate"],
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
    "Percentage": percentage,
    "Reward": reward,
    "Loyal": loyal,
    "LoyalReward": loyalReward,
    "StartDate": startDate,
    "EndDate": endDate,
  };
}
