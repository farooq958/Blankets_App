part of '../Controller/notification_cubit.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationsModel> notifications;

  NotificationLoaded({required this.notifications});
}

class NotificationError extends NotificationState {
  String error;

  NotificationError({required this.error});
}
