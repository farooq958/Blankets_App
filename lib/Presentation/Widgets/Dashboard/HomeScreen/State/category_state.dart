part of '../Controller/category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategoryLoading extends CategoryState {}
class CategoryLoaded extends CategoryState {
  final List<CategoryModel> categoryData;
  CategoryLoaded({required this.categoryData});
}
class CategoryError extends CategoryState {
  final String? error;

  CategoryError({this.error});
}


