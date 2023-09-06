part of '../Controller/add_cart_cubit.dart';

@immutable
abstract class AddCartState {}

class AddCartInitial extends AddCartState {}
class AddCartLoading extends AddCartState {}
class AddCartLoaded extends AddCartState {}
class AddCartError extends AddCartState {}
