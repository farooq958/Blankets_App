import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:hbk/Data/Repository/AboutUs/about_us_repo.dart';
import 'package:hbk/Domain/Models/AboutUs/about_us_model.dart';

part 'package:hbk/Presentation/Widgets/AboutUs/State/about_us_state.dart';


class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit() : super(AboutUsInitial());

   getAboutUsData() async {


   await Future.delayed(const Duration(milliseconds: 500));
   emit(AboutUsLoading());
    try {

      await AboutUsRepo().getAboutUsData().then((value) {


          AboutUs aboutUsData = AboutUs.fromJson(value);

          emit(AboutUsSuccess(aboutUsData));

      }).catchError((e) {
        emit(AboutUsError(e));
      });
    } catch (e) {
      emit(AboutUsError(e.toString()));
    }
  }
}
