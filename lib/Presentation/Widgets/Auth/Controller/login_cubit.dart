import 'package:bloc/bloc.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/Repository/Auth/auth_repo.dart';
import 'package:meta/meta.dart';

part '../State/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  loginTheUser(username,password) async {


    await Future.delayed(const Duration(milliseconds: 16));
    emit(LoginLoading());
    try {

      await AuthRepo().loginIt(username, password).then((value) {
        print("object");
        // print(username + password);
         print(value);
if(value['UserDetails']!= null && value['Message']== null)
  {

    SharedPrefs.setUserLoginData(userRawData: value['UserDetails']);
    var data = SharedPrefs.getUserLoginData();
    print("${data!.userDetails?.cardCode}card code username");
    emit(LoginSuccess());
  }
if(value['error']!= null)
  {

    emit(LoginError(error: value['error_description']));

  }








      }).catchError((e) {
        throw e;
        emit(LoginError(error: e));
      });
    } catch (e) {
      rethrow;
      emit(LoginError(error:e.toString()));
    }
  }
  
}
