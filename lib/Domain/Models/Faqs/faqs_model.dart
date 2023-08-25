// To parse this JSON data, do
//
//     final faqsModel = faqsModelFromJson(jsonString);

import 'dart:convert';

FaqsModel faqsModelFromJson(String str) => FaqsModel.fromJson(json.decode(str));

String faqsModelToJson(FaqsModel data) => json.encode(data.toJson());

class FaqsModel {
  List<Faq> faqs;

  FaqsModel({
   required this.faqs,
  });

  factory FaqsModel.fromJson(Map<String, dynamic> json) => FaqsModel(
    faqs: json["faqs"] == null ? [] : List<Faq>.from(json["faqs"].map((x) => Faq.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "faqs": faqs == null ? [] : List<dynamic>.from(faqs.map((x) => x.toJson())),
  };
}

class Faq {
  String? question;
  String? ans;

  Faq({
    this.question,
    this.ans,
  });

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
    question: json["question"],
    ans: json["ans"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "ans": ans,
  };
}
