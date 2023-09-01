part of '../Controller/reward_controller_cubit.dart';

@immutable
abstract class RewardControllerState {}

class RewardControllerInitial extends RewardControllerState {}
class RewardLoading extends RewardControllerState {}
class RewardLoaded extends RewardControllerState {

final  List<RewardApiModel> rewData;
final List<RewardModel> actualRewardData;
  RewardLoaded({required this.rewData, required this.actualRewardData});

}
class RewardLogOutState extends RewardControllerState {}
class RewardError extends RewardControllerState {

  final String error;
  RewardError({required this.error});

}
