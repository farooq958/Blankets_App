// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  final String? catId;
  final String? cat;
  final String? catImgJpg;
  final String? catImgPng;
  final int? oitbId;

  CategoryModel({
    this.catId,
    this.cat,
    this.catImgJpg,
    this.catImgPng,
    this.oitbId,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        catId: json["Cat_ID"],
        cat: json["Cat"],
        catImgJpg: json["Cat_Img_jpg"],
        catImgPng: json["Cat_Img_png"],
        oitbId: json["OITB_Id"],
      );

  Map<String, dynamic> toJson() => {
        "Cat_ID": catId,
        "Cat": cat,
        "Cat_Img_jpg": catImgJpg,
        "Cat_Img_png": catImgPng,
        "OITB_Id": oitbId,
      };
}
