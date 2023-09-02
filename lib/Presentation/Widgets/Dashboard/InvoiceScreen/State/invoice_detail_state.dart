part of '../Controller/invoice_detail_cubit.dart';

@immutable
abstract class InvoiceDetailState {}

class InvoiceDetailInitial extends InvoiceDetailState {}
class InvoiceDetailLoading extends InvoiceDetailState {}
class InvoiceDetailLoaded extends InvoiceDetailState {
  final  List<InvoiceDetailApiModel> rawData;
  final List<InvoiceDetailModel> actualInvoiceData;
final  double totalCtn;
 final  double totalPcs;
 final double grandTotal;
  InvoiceDetailLoaded({required this.rawData, required this.actualInvoiceData,required this.totalCtn,required this.totalPcs,required this.grandTotal});

}
class InvoiceDetailLogOutState extends InvoiceDetailState {}
class InvoiceDetailError extends InvoiceDetailState {
  final String error;

  InvoiceDetailError({required this.error});
}
