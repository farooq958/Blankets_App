part of '../Controller/read_notification_cubit.dart';

@immutable
abstract class ReadNotificationState {}

class ReadNotificationInitial extends ReadNotificationState {}

class ReadNotificationLoading extends ReadNotificationState {}

class ReadNotificationLoaded extends ReadNotificationState {}

class ReadNotificationError extends ReadNotificationState {
  String error;

  ReadNotificationError({required this.error});
}
