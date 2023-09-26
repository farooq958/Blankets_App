part of '../Controller/all_products_cubit.dart';

@immutable
abstract class AllProductsState {}

class AllProductsInitial extends AllProductsState {}

class AllProductsLoading extends AllProductsState {}

class LogOutProductState extends AllProductsState {}

class AllProductsLoaded extends AllProductsState {
  final List<ProductApiModel> allProductsData;

  AllProductsLoaded({required this.allProductsData});
}

class AllProductsError extends AllProductsState {
  final String? error;
  final int status;

  AllProductsError({this.error, required this.status});
}
