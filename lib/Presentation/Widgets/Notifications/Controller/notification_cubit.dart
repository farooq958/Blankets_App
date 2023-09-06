import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../Data/AppData/app_preferences.dart';
import '../../../../Data/Repository/AboutUs/about_us_repo.dart';
import '../../../../Data/Repository/Notification/notification_repo.dart';
import '../../../../Domain/Models/Notification/notification_model.dart';

part '../State/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  getNotification() async {
    // getShadePref to access user CardCode
    String? cardCode = SharedPrefs.userData!.cardCode;

    emit(NotificationLoading());

    try {
      await NotificationRepo().getNotifications(cardCode!).then((value) {
        if (value.runtimeType != int) {
          print("notification in cubits${value}");
          if (value['Message'] == null) {
            var notification = List<NotificationsModel>.from(
                value.map((x) => NotificationsModel.fromJson(x)));
            emit(NotificationLoaded(notifications: notification));
          } else {
            emit(NotificationError(error: value['Message']));
          }
        } else {
          print('condition false');
        }
      }).catchError((e) {
        emit(NotificationError(error: "Something Went Wrong"));
      });
    } catch (e) {
      emit(NotificationError(error: e.toString()));
    }
  }
}
