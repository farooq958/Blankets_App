import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hbk/Data/DataSource/Resources/api_constants.dart';

import '../../../Application/Services/ApiServices/api_services.dart';

class CreateNewPassword {
  Future updatePassword(
      String cardCode, String password, String updatePass) async {
    try {
      String perms =
          'updatePassword?cardcode=$cardCode&password=$password&updatedpassword=$updatePass';

      return await Api.getCat(updatePasswordUrl + perms).then((value) {
        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }
}
