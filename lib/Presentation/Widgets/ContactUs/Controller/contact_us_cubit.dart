

import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/Repository/ContactUs/contact_us_repo.dart';
import 'package:hbk/Domain/Models/ContactUs/contact_us_model.dart';
import 'package:hbk/Presentation/Widgets/ContactUs/State/contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState>{
  ContactUsCubit(): super(const ContactUsInitial());

  getContactUsData()async {
    await Future.delayed(const Duration(milliseconds: 300));
    emit(const ContactUsLoading());


    try{
      await ContactUsRepo().getContactUsData().then((value) {
        print("Loaded ${value['branches']}");

        final ContactUs data = ContactUs.fromJson(value);

        print("Data ${data.branches?[2].timing}");

        emit(ContactUsSuccess(data));
      }).catchError((e){
        print("Error $e");
        emit(ContactUsError(e));
      });
    }catch(e){

      print("Error from catch $e");
      emit(ContactUsError(e.toString()));
    }

  }
}