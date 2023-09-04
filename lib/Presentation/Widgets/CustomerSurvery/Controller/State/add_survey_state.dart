part of '../add_survey_cubit.dart';

@immutable
abstract class AddSurveyState {}

class AddSurveyInitial extends AddSurveyState {}

class AddSurveyLoading extends AddSurveyState {}

class AddSurveyLoaded extends AddSurveyState {}

class AddSurveyError extends AddSurveyState {
  String error;

  AddSurveyError({required this.error});
}
