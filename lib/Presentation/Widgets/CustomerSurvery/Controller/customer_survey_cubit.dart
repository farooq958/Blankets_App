

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/Repository/CustomerSurveyRepo/customer_survey_repo.dart';
import 'package:hbk/Domain/Models/CustomerSurvey/customer_survey.dart';
import 'package:hbk/Presentation/Widgets/CustomerSurvery/State/customer_survey_state.dart';

class CustomerSurveyQuestionCubit extends Cubit<CustomerSurveyState>{
  CustomerSurveyQuestionCubit():super(CustomerSurveyInitial());


  Future getCustomerSurveyQuestions(cardCode)async {
await Future.delayed(const Duration(milliseconds: 16 ));
    emit(CustomerSurveyLoading());


    try{
      await CustomerSurveyRepo().getSurveyQuestions(cardCode).then((value) {

        print("SurveyData is $value");

        var customerSurveyQuestions = List<CustomerSurvey>.from(
            value.map((x) => CustomerSurvey.fromJson(x)));

emit(CustomerSurveyLoaded(customerSurveyQuestions));


      }).catchError((e){
        throw e;
        emit(CustomerSurveyError(e.toString()));
      });
    }catch(e){
      rethrow;
      emit(CustomerSurveyError((e.toString())));
    }
  }
}