import 'dart:convert';

class CategoryModel {
  final String? catId;
  final String? cat;
  final int? oitbId;

  CategoryModel({
    this.catId,
    this.cat,
    this.oitbId,
  });

  factory CategoryModel.fromJson(String str) => CategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
    catId: json["Cat_ID"],
    cat: json["Cat"],
    oitbId: json["OITB_Id"],
  );

  Map<String, dynamic> toMap() => {
    "Cat_ID": catId,
    "Cat": cat,
    "OITB_Id": oitbId,
  };
}
