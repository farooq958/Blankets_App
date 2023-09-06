part of '../Controller/post_order_cubit.dart';

@immutable
abstract class PostOrderState {}

class PostOrderInitial extends PostOrderState {}
class PostOrderLoading extends PostOrderState {}
class PostOrderSuccess extends PostOrderState {}
class PostOrderError extends PostOrderState {
  final String error;
  PostOrderError(this.error);

}
