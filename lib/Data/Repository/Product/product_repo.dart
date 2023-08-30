import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hbk/Application/Services/ApiServices/api_services.dart';
import 'package:hbk/Data/DataSource/Resources/api_constants.dart';

class ProductRepo{


  Future<dynamic> getProduct(url)async{
    try{

      return await Api.getCat(url).then((value){
        if (kDebugMode) {
          print("P Response $value");
        }
        if(value.runtimeType != int) {
          return jsonDecode(value);
        }
        else
          {
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