part of '../create_new_password_cubit.dart';

@immutable
abstract class CreateNewPasswordState {}

class CreateNewPasswordInitial extends CreateNewPasswordState {}

class CreateNewPasswordLoading extends CreateNewPasswordState {}

class CreateNewPasswordLoaded extends CreateNewPasswordState {
  String message;

  CreateNewPasswordLoaded({required this.message});
}

class CreateNewPasswordError extends CreateNewPasswordState {
  String error;

  CreateNewPasswordError({required this.error});
}
