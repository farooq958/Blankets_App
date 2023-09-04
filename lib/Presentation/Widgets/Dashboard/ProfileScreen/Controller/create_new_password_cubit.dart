import 'package:bloc/bloc.dart';
import 'package:hbk/Data/Repository/CreateNewPassword/create_new_password_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../Data/AppData/app_preferences.dart';

part 'State/create_new_password_state.dart';

class CreateNewPasswordCubit extends Cubit<CreateNewPasswordState> {
  CreateNewPasswordCubit() : super(CreateNewPasswordInitial());

  updatePassword(String password, String updatePassword) async {
    emit(CreateNewPasswordLoading());

    String? cardCode = SharedPrefs.userData!.cardCode;

    try {
      await CreateNewPassword()
          .updatePassword(cardCode!, password, updatePassword)
          .then((value) {
        print("value in cubit $value");
        if (value.runtimeType != int) {
          emit(CreateNewPasswordLoaded(message: value));
        } else {
          print('condition false');
        }
      }).catchError((e) {
        emit(CreateNewPasswordError(error: e.toString()));
      });
    } catch (e) {
      emit(CreateNewPasswordError(error: e.toString()));
    }
  }
}
