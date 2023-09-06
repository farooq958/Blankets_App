part of '../Controller/new_arrival_product_cubit.dart';

@immutable
abstract class NewArrivalProductState {}

class NewArrivalProductInitial extends NewArrivalProductState {}
class NewArrivalProductLoading extends NewArrivalProductState {}
class LogOutStateNewArrival extends NewArrivalProductState {}
class NewArrivalIndividualLoading extends NewArrivalProductState{}
class NewArrivalProductLoaded extends NewArrivalProductState {

  final List<ProductApiModel> newArrivalData;
  NewArrivalProductLoaded({required this.newArrivalData});

}
class NewArrivalProductError extends NewArrivalProductState {

  final String? error;

  NewArrivalProductError({this.error});
}
