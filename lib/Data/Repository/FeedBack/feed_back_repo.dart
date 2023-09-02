import 'package:hbk/Application/Services/ApiServices/api_services.dart';


class FeedBackRepo {
  FeedBackRepo();

  Future postFeedBack(Map<String, dynamic> feedbackData) async {

    print("In Repo Data $feedbackData");
    try {
      return await Api.post1(url:'http://imtxt.sbsolutions.com.pk:44891/api/PostApis/PostAppFeedback', feedbackData).then((value) {

        print("value $value");
        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }
}
