import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hbk/Application/Services/ApiServices/api_services.dart';

class CustomerSurveyRepo {
  CustomerSurveyRepo();

  Future<dynamic> getSurveyQuestions(cardCode) async {
    try {
      return await Api.getCat(
              'http://imtxt.sbsolutions.com.pk:44891/api/lookupapi/GetAllQuestions?CardCode=$cardCode')
          .then((value) {
        if (kDebugMode) {
          print("category Response $value");
        }
        if (value.runtimeType != int) {
          return jsonDecode(value);
        } else {
          // print("here");
          return value;
        }
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }
}
