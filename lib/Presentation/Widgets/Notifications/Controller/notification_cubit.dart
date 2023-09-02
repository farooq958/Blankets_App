import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../Data/Repository/AboutUs/about_us_repo.dart';
import '../../../../Data/Repository/Notification/notification_repo.dart';
import '../../../../Domain/Models/Notification/notification_model.dart';

part '../State/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  getNotification() async {
    emit(NotificationLoading());

    try {
      await NotificationRepo().getNotifications().then((value) {
        if (value.runtimeType != int) {
          var notification = List<NotificationsModel>.from(
              value.map((x) => NotificationsModel.fromJson(x)));
          emit(NotificationLoaded(notifications: notification));
        } else {
          print('condition false');
        }
      }).catchError((e) {
        emit(NotificationError(error: e.toString()));
      });
    } catch (e) {
      emit(NotificationError(error: e.toString()));
    }
  }
}
