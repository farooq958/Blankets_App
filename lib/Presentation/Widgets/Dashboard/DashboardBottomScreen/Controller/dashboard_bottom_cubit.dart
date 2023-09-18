import 'package:bloc/bloc.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Data/Repository/DashboardRep/dashboard_repo.dart';
import 'package:hbk/Domain/Models/Dashboard/dashboard_model.dart';
import 'package:hbk/Domain/Models/DashboardBottomModel/bottom_card_model.dart';
import 'package:meta/meta.dart';

part '../State/dashboard_bottom_state.dart';

class DashboardBottomCubit extends Cubit<DashboardBottomState> {
  DashboardBottomCubit() : super(DashboardBottomInitial());

  getDashboardData() async {
    await Future.delayed(const Duration(milliseconds: 16));
    emit(DashboardLoading());
    try {
      await DashboardRepo().getDashboardData().then((value) {
        if (value.runtimeType != int) {
          var dashData = List<DashboardModel>.from(
              value.map((x) => DashboardModel.fromMap(x)));
          // Utils.dashData = dashData;
          List<BottomCardModel> bottomCardData1 = [
            BottomCardModel(
                'Sale Required', "Rs ${dashData[0].nextSales.toString()}",
                Assets.dashboardSaleOfSession),
            BottomCardModel('Running Status', dashData[0].status.toString(),
                Assets.dashboardRunningStatus),
            BottomCardModel('Next Target', dashData[0].nextStatus.toString(),
                Assets.dashBoardNextTarget),
            BottomCardModel(
                'Current Sale', 'Rs ${dashData[0].netSales.toString()}',
                Assets.dashboardSaleRequired),
            BottomCardModel(
                'Pending Orders',
                'Rs  ${SharedPrefs.userData!.ordersBal.toString()}',
                Assets.dashboardPendingOrders),
            BottomCardModel(
                'Total Winning', 'Rs ${dashData[0].totalReward.toString()}',
                Assets.dashboardTotalWinning),
          ];


          emit(DashboardLoaded(
              dashData: dashData, bottomCardData1: bottomCardData1));
        } else {
          emit(DashboardLogOutState());
        }
      }).catchError((e) {
        //throw e;
        emit(DashboardError(error: e));
      });
    } catch (e) {
      //rethrow;
      emit(DashboardError(error: e.toString()));
    }
  }
}
