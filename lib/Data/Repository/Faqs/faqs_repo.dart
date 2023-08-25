

import 'package:hbk/Application/Services/ApiServices/api_services.dart';
import 'package:hbk/Data/DataSource/Resources/api_constants.dart';

class FaqsRepo {
  FaqsRepo();

  Future<Map<String,dynamic>> getFaqsData()async{
    try{
      return await Api.get(faqUrl).then((value) {
        print('api data');
        print(value);
        return value;
      }).catchError((e){
        throw e;
      });
    }catch(e){
      rethrow;
    }
  }
}