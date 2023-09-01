import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hbk/Application/Services/ApiServices/api_services.dart';
import 'package:hbk/Data/DataSource/Resources/api_constants.dart';

class CategoryRepo{
  CategoryRepo();

  Future<dynamic> getCategoryData()async{
    try{
      return await Api.getCat(categoryUrl).then((value){
        if (kDebugMode) {
          print("category Response $value");
        }
        if(value.runtimeType != int) {
          return jsonDecode(value);
        }
        else {
          return value;
        }
      }).catchError((e){
        throw e;
      });
    }catch(e){
      rethrow;
    }
  }
}