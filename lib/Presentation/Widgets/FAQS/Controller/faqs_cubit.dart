

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/Repository/Faqs/faqs_repo.dart';
import 'package:hbk/Domain/Models/Faqs/faqs_model.dart';
import 'package:hbk/Presentation/Widgets/FAQS/State/faqs_state.dart';

class FaqsCubit extends Cubit<FaqsState>{
  FaqsCubit() : super(FaqsInitial());

  getFaqsData() async {

   await Future.delayed(const Duration(milliseconds: 400));
    emit(FaqsLoading());

    try{
      await FaqsRepo().getFaqsData().then((value) {
        print(value);
        var faqsData = List<Faq>.from(value["faqs"].map((x) => Faq.fromJson(x))) ;
        emit(FaqsSuccess( faqsModel: faqsData));
      }).catchError((e){
        print(e);
        throw e;
        emit(FaqsError(e));});
    }catch(e){
      print(e);
      rethrow;
      emit(FaqsError(e.toString()));
    }
  }

}