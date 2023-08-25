import 'package:flutter/foundation.dart';
import 'package:hbk/Application/Services/ApiServices/api_services.dart';
import 'package:hbk/Data/DataSource/Resources/api_constants.dart';

class AboutUsRepo{
  AboutUsRepo();

  Future<Map<String,dynamic>> getAboutUsData()async{
    try{
      return await Api.get(aboutUsUrl).then((value){
        if (kDebugMode) {
          print("AboutUs Response $value");
        }
        return value;
      }).catchError((e){
        throw e;
      });
    }catch(e){
      rethrow;
    }
  }
}