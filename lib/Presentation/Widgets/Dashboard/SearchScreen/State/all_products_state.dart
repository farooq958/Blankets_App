part of '../Controller/all_products_cubit.dart';

@immutable
abstract class AllProductsState {}

class AllProductsInitial extends AllProductsState {}
class AllProductsLoading extends AllProductsState {}
class AllProductsLoaded extends AllProductsState {

  final List<ProductApiModel> allProductsData;
  AllProductsLoaded({required this.allProductsData});

}
class AllProductsError extends AllProductsState {

  final String? error;

  AllProductsError({this.error});
}