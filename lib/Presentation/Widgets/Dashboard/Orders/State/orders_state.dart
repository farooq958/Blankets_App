part of '../Controller/orders_cubit.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersLoaded extends OrdersState {
  List<OrdersApiModel> model;

  OrdersLoaded({required this.model});
}

class OrdersError extends OrdersState {
  String error;

  OrdersError({required this.error});
}
