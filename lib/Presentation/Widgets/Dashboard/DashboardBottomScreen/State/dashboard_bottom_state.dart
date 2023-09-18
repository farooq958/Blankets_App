part of '../Controller/dashboard_bottom_cubit.dart';

@immutable
abstract class DashboardBottomState {}

class DashboardBottomInitial extends DashboardBottomState {}

class DashboardLoading extends DashboardBottomState {}

class DashboardLoaded extends DashboardBottomState {
  final List<DashboardModel> dashData;
  final List<BottomCardModel> bottomCardData1;

  DashboardLoaded({required this.dashData, required this.bottomCardData1});
}

class DashboardLogOutState extends DashboardBottomState {}

class DashboardError extends DashboardBottomState {
  final String error;

  DashboardError({required this.error});
}
