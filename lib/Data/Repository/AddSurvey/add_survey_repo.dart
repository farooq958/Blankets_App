import 'dart:convert';

import 'package:hbk/Data/DataSource/Resources/api_constants.dart';

import '../../../Application/Services/ApiServices/api_services.dart';
import '../../AppData/app_preferences.dart';

class AddSurveyRepo {
  Future addSurvey({required List<Map<String, String>> listData}) async {
    String? rCode = SharedPrefs.userData!.cardCode;

    final data = {'rcode': rCode.toString(), 'griddata': json.encode(listData)};

    var header = {
      "Authorization": "Bearer ${SharedPrefs.getUserToken()}",
      'Content-Type': 'application/x-www-form-urlencoded',
      //'Content-Type': 'application/json'
    };

    return await Api.post(addSurveyUrl, data, header: header).then((value) {
      print("api data call$value");
      return value;
    });
  }
}
