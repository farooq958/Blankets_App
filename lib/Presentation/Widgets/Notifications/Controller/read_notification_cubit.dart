import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../Data/Repository/Notification/notification_repo.dart';

part '../State/read_notification_state.dart';

class ReadNotificationCubit extends Cubit<ReadNotificationState> {
  ReadNotificationCubit() : super(ReadNotificationInitial());

  readNotification(String aCode, String rCode) async {
    emit(ReadNotificationLoading());

    try {
      await NotificationRepo().readNotification(aCode, rCode).then((value) {
        bool? status = value['success'];
        print(status);
        if (status == false) {
          emit(ReadNotificationError(error: 'Error'));
        } else {
          emit(ReadNotificationLoaded());
        }
      }).catchError((e) {
        emit(ReadNotificationError(error: e.toString()));
      });
    } catch (e) {
      emit(ReadNotificationError(error: e.toString()));
    }
  }
}
