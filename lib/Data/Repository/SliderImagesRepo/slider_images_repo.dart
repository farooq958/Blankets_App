

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hbk/Application/Services/ApiServices/api_services.dart';
import 'package:hbk/Data/DataSource/Resources/api_constants.dart';

import 'package:http/http.dart' as http;

class SliderImagesRepo{
  SliderImagesRepo();


  Future<dynamic> getSliderImages()async{
    try{
      return await Api.getCat(sliderImagesUrl).then((value){
        if (kDebugMode) {
          print("category Response $value");
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

// ;
// return await http.then((value){
// print("Data is $value");
// return value;
// })