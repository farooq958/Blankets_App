part of '../Controller/cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}
class CartLoading extends CartState {}
class CartLoaded extends CartState {

  final List<CartModel> cartData;
  CartLoaded({required this.cartData});

}
class CartError extends CartState {}
