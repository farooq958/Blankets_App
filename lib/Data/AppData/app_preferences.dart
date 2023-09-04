import 'dart:convert';

import 'package:hbk/Domain/Models/Auth/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  /// reference of Shared Preferences
  static SharedPreferences? _preferences;
  static UserDetails? userData;

  /// Initialization of Shared Preferences
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  ///survey
  static Future setSurveyDate({required String? survey}) async =>
      await _preferences?.setString("survey", survey ?? 'no');

  static String? getSurvey() => _preferences!.getString("survey");

  ///token
  static Future setUserToken({required String? token}) async =>
      await _preferences?.setString("token", token ?? 'no_token');

  static String? getUserToken() => _preferences!.getString("token");

  ///UserData stored in json
  ///userRawData will be in map<String,dynamic>
  static Future setUserLoginData(
          {required Map<String, dynamic> userRawData}) async =>
      await _preferences?.setString(
          "user", jsonEncode(userRawData) ?? 'no_data');

  static UserDetails? getUserLoginData() {
    String? userJson = _preferences!.getString("user") ?? "no_data";
    if (userJson == "no_data") {
      return userData;
    } else {
      userData = UserDetails.fromJson(userJson);

      return userData;
    }

    ///response of user
    //{
    //     "success": true,
    //     "error": null,
    //     "user": {
    //         "email": "farooq@gmail.com",
    //         "isSocialLogin": false,
    //         "profile_image": "",
    //         "created_by": null,
    //         "club": null,
    //         "position": null,
    //         "num_of_students": null,
    //         "mobileToken": [],
    //         "_id": "64549437546691cf600be64d"
    //     },
    //     "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NTQ5NDM3NTQ2NjkxY2Y2MDBiZTY0ZCIsImlhdCI6MTY4MzI2NDU2NywiZXhwIjoxNjg1ODU2NTY3fQ.6XCI2_aNiZ3hMg0KPT-9yVwXgsUFuvVAnfqX0Sh9TWc"
    // }
  }

  static clearPref() {
    return _preferences?.clear();
  }
}
