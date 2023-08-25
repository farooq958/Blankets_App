
import 'package:flutter/cupertino.dart';
import 'package:hbk/Domain/Models/Faqs/faqs_model.dart';

@immutable
abstract class FaqsState {}

class FaqsInitial extends FaqsState{
  FaqsInitial();
}

class FaqsLoading extends FaqsState{
  FaqsLoading();
}

class FaqsError extends FaqsState{
  final String errorMsg;

  FaqsError(this.errorMsg);
}

class FaqsSuccess extends FaqsState{
  final List<Faq> faqsModel;

  FaqsSuccess( {required this.faqsModel});

}