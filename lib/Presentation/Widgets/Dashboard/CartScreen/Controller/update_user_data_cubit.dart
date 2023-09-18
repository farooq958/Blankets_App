import 'package:bloc/bloc.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/DataSource/Resources/utils.dart';
import 'package:hbk/Data/Repository/Auth/auth_repo.dart';
import 'package:hbk/Domain/Models/DashboardBottomModel/custom_card_model.dart';
import 'package:hbk/Presentation/Widgets/Auth/Controller/login_cubit.dart';
import 'package:meta/meta.dart';

part 'update_user_data_state.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataState> {
  UpdateUserDataCubit() : super(UpdateUserDataInitial());

  Future updateData(username, password) async {
    await Future.delayed(const Duration(milliseconds: 16));
    emit(UpdateLoading());
    try {
      await AuthRepo().updateSharedPref(username, password).then((value) async {
        print("object");
        // print(username + password);
        // print(value['UserDetails']);
        if (value['UserDetails'] != null && value['Message'] == null) {
          await SharedPrefs.setUserLoginData(userRawData: value['UserDetails']);
          var data = SharedPrefs.getUserLoginData();
          print("${data!.ordersBal}order num");

          final List<CustomCardModel> customCardData = [
            CustomCardModel(
                amount: data.creditLimit.toString(), name: "Credit limit"),
            CustomCardModel(
                amount: Utils.getGraceLimit(
                    data.creditLimit.toString(), data.tolerance.toString()),
                name: "Tolerance limit(${data.tolerance.toString()}%)"),
            CustomCardModel(
                amount: data.specialDeal.toString(), name: "Special deal"),
            CustomCardModel(
                amount: Utils.getMaxLimit(data.creditLimit.toString(),
                    data.tolerance.toString(), data.specialDeal.toString()),
                name: "Max limit"),
            CustomCardModel(
                amount: Utils.getOverLimit(data.balance.toString(),
                    data.creditLimit.toString(), data.ordersBal.toString()),
                name: "Over limit"),
            CustomCardModel(
                amount: Utils.getAvailableLimit(
                    data.creditLimit.toString(),
                    data.tolerance.toString(),
                    data.balance.toString(),
                    data.ordersBal.toString(),
                    data.specialDeal.toString()),
                name: "Available limit"),
          ];

          emit(UpdateSuccess(customCardData: customCardData));
        }
        if (value['error'] != null) {
          emit(UpdateError(error: value['error_description']));
        }
      }).catchError((e) {
        // throw e;
        emit(UpdateError(error: e.toString()));
      });
    } catch (e) {
      // rethrow;
      emit(UpdateError(error: 'something went wrong'));
    }
  }
}
