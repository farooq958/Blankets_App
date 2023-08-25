

import 'package:hbk/Application/Services/ApiServices/api_services.dart';
import 'package:hbk/Data/DataSource/Resources/api_constants.dart';

class ContactUsRepo {
  ContactUsRepo();

  Future<Map<String,dynamic>> getContactUsData() async {
   try{
     return await Api.get(contactUsUrl).then((value) {
       return value;
     }).catchError((e){
       throw e;
     });
   }catch(e){
     rethrow;
   }
  }
}