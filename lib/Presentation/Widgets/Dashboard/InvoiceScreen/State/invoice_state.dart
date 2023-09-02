part of '../Controller/invoice_cubit.dart';

@immutable
abstract class InvoiceState {}

class InvoiceInitial extends InvoiceState {}
class InvoiceLoading extends InvoiceState {}
class InvoiceLoaded extends InvoiceState {
  final  List<InvoiceApiModel> rawData;
  final List<InvoiceModel> actualInvoiceData;
  InvoiceLoaded({required this.rawData, required this.actualInvoiceData});

}
class InvoiceLogOutState extends InvoiceState {}
class InvoiceError extends InvoiceState {
final String error;

  InvoiceError({required this.error});
}



