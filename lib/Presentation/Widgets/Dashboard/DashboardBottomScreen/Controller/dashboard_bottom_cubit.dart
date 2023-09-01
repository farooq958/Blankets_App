import 'package:bloc/bloc.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Data/Repository/DashboardRep/dashboard_repo.dart';
import 'package:hbk/Domain/Models/Dashboard/dashboard_model.dart';
import 'package:meta/meta.dart';

part '../State/dashboard_bottom_state.dart';

class DashboardBottomCubit extends Cubit<DashboardBottomState> {
  DashboardBottomCubit() : super(DashboardBottomInitial());

  getDashboardData() async {


    await Future.delayed(const Duration(milliseconds: 16));
    emit(DashboardLoading());
    try {

      await DashboardRepo().getDashboardData().then((value) {

        if(value.runtimeType != int) {
          var dashData = List<DashboardModel>.from(
              value.map((x) => DashboardModel.fromMap(x)));
          Utils.dashData=dashData;


          emit(DashboardLoaded(dashData: dashData));
        }
        else
        {
          emit(DashboardLogOutState());
        }
      }).catchError((e) {
        //throw e;
        emit(DashboardError(error: e));
      });
    } catch (e) {
      //rethrow;
      emit(DashboardError(error:e.toString()));
    }
  }

}
