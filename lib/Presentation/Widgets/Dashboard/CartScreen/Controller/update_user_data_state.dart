part of 'update_user_data_cubit.dart';

@immutable
abstract class UpdateUserDataState {}

class UpdateUserDataInitial extends UpdateUserDataState {}

class UpdateLoading extends UpdateUserDataState {}

class UpdateSuccess extends UpdateUserDataState {
  final List<CustomCardModel> customCardData;

  UpdateSuccess({required this.customCardData});
}

class UpdateError extends UpdateUserDataState {
  final String error;
  final int status;

  UpdateError({
    required this.error,
    required this.status,
  });
}
