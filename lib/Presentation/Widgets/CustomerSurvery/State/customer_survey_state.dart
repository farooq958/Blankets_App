import 'package:hbk/Domain/Models/CustomerSurvey/customer_survey.dart';
import 'package:hbk/Presentation/Widgets/CustomerSurvery/customer_survery.dart';

abstract class CustomerSurveyState {}

class CustomerSurveyInitial extends CustomerSurveyState{
  CustomerSurveyInitial();
}


class CustomerSurveyLoading extends CustomerSurveyState{
  CustomerSurveyLoading();
}


class CustomerSurveyError extends CustomerSurveyState{
  final String error;
  CustomerSurveyError(this.error);
}


class CustomerSurveyLoaded extends CustomerSurveyState{
  final List<CustomerSurvey> questionsData;

  CustomerSurveyLoaded(this.questionsData);
}