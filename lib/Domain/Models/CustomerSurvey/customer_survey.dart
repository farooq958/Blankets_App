// To parse this JSON data, do
//
//     final customerSurvey = customerSurveyFromJson(jsonString);

import 'dart:convert';

List<CustomerSurvey> customerSurveyFromJson(String str) => List<CustomerSurvey>.from(json.decode(str).map((x) => CustomerSurvey.fromJson(x)));

String customerSurveyToJson(List<CustomerSurvey> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerSurvey {
  int? id;
  String? qcode;
  String? type;
  String? title;
  String? imageUrl;
  String? startDate;
  String? endDate;
  String? createdDate;
  String? titleDetail;
  String? sno;
  String? qnumber;
  String? question;
  String? pstatus;

  CustomerSurvey({
    this.id,
    this.qcode,
    this.type,
    this.title,
    this.imageUrl,
    this.startDate,
    this.endDate,
    this.createdDate,
    this.titleDetail,
    this.sno,
    this.qnumber,
    this.question,
    this.pstatus,
  });

  factory CustomerSurvey.fromJson(Map<String, dynamic> json) => CustomerSurvey(
    id: json["id"],
    qcode: json["Qcode"],
    type: json["Type"],
    title: json["Title"],
    imageUrl: json["ImageUrl"],
    startDate: json["StartDate"],
    endDate: json["EndDate"],
    createdDate: json["CreatedDate"],
    titleDetail: json["TitleDetail"],
    sno: json["Sno"],
    qnumber: json["Qnumber"],
    question: json["question"],
    pstatus: json["Pstatus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Qcode": qcode,
    "Type": type,
    "Title": title,
    "ImageUrl": imageUrl,
    "StartDate": startDate,
    "EndDate": endDate,
    "CreatedDate": createdDate,
    "TitleDetail": titleDetail,
    "Sno": sno,
    "Qnumber": qnumber,
    "question": question,
    "Pstatus": pstatus,
  };
}
