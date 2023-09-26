import 'package:bloc/bloc.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/Repository/Auth/auth_repo.dart';
import 'package:meta/meta.dart';

part '../State/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  loginTheUser(username, password) async {
    await Future.delayed(const Duration(milliseconds: 16));
    emit(LoginLoading());
    try {
      await AuthRepo().loginIt(username, password).then((value) async {
        print("object");
        // print(username + password);
        print(value['UserDetails']);
        print(value['error']);
        print(value['success']);
        if (value['UserDetails'] != null && value['Message'] == null) {
          await SharedPrefs.setUserName(username: username);
          await SharedPrefs.setPassword(password: password);
          await SharedPrefs.setUserLoginData(userRawData: value['UserDetails']);
          var data = SharedPrefs.getUserLoginData();
          print("${data!.cardName}card code username");
          emit(LoginSuccess());
        }
        if (value['error'] != null && value['success'] == null) {
          emit(LoginError(error: value['error_description'] ?? value['error']));
        }
        if (value['success'] != null) {
          emit(LoginError(error: value['error']));
        }
      }).catchError((e) {
        throw e;
        emit(LoginError(error: e));
      });
    } catch (e) {
      rethrow;
      emit(LoginError(error: e.toString()));
    }
  }
}
