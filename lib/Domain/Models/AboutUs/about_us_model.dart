// To parse this JSON data, do
//
//     final aboutUs = aboutUsFromJson(jsonString);

import 'dart:convert';

AboutUs aboutUsFromJson(String str) => AboutUs.fromJson(json.decode(str));

String aboutUsToJson(AboutUs data) => json.encode(data.toJson());

class AboutUs {
  String? introduction;
  String? achievements;
  String? ourVision;
  String? mission;
  String? ourValues;
  String? whatMakeUsDifferent;

  AboutUs({
    this.introduction,
    this.achievements,
    this.ourVision,
    this.mission,
    this.ourValues,
    this.whatMakeUsDifferent,
  });

  factory AboutUs.fromJson(Map<String, dynamic> json) => AboutUs(
    introduction: json["introduction"],
    achievements: json["achievements"],
    ourVision: json["Our_vision"],
    mission: json["mission"],
    ourValues: json["Our_values"],
    whatMakeUsDifferent: json["What_make_us_different"],
  );

  Map<String, dynamic> toJson() => {
    "introduction": introduction,
    "achievements": achievements,
    "Our_vision": ourVision,
    "mission": mission,
    "Our_values": ourValues,
    "What_make_us_different": whatMakeUsDifferent,
  };
}
