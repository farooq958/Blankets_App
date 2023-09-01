import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hbk/Application/Services/ApiServices/api_services.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/DataSource/Resources/api_constants.dart';

class DashboardRepo{


  Future<dynamic> getDashboardData()async{
    try{
      return await Api.getCat(dashUrl+SharedPrefs.userData!.cardCode.toString()).then((value){
        if (kDebugMode) {
          print("Dash Response $value");
        }
        if(value.runtimeType != int) {
          return jsonDecode(value);
        }
        else {
          // print("here");
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