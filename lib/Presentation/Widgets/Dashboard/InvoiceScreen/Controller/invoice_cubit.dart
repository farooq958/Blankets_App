import 'package:bloc/bloc.dart';
import 'package:hbk/Data/Repository/InvoiceRepo/invoice_repo.dart';
import 'package:hbk/Domain/Models/Invoice/invoice_api_model.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/InvoiceScreen/invoice_screen.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part '../State/invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  InvoiceCubit() : super(InvoiceInitial());


  getInvoicesData(String startDate,String endDate) async {


    await Future.delayed(const Duration(milliseconds: 16));
    emit(InvoiceLoading());
    try {

      await InvoiceRepo().getInvoices().then((value) {
        DateTime startD= DateTime.parse(startDate);
        DateTime endD= DateTime.parse(endDate);
        if(value.runtimeType != int) {
          var invoiceDto = List<InvoiceApiModel>.from(
              value.map((x) => InvoiceApiModel.fromMap(x)));
          // Utils.dashData=dashData;
          List<InvoiceModel> actualInvoiceData= [];

          var invoiceFilteredData=filterStatementsByDate(invoiceDto, startD, endD);
          for(var i in invoiceFilteredData)
          {
            actualInvoiceData.add(InvoiceModel(

              date: i.postingDate.toString().split(' ').first,
              invoiceNo: i.docEntry.toString(),
              noOfCtns: i.sumofSalesQuantities.toString(),
              total: i.docTotal.toString()

            ));

          }

          emit(InvoiceLoaded(rawData: invoiceDto,actualInvoiceData:actualInvoiceData));
        }
        else
        {
          emit(InvoiceLogOutState());
        }
      }).catchError((e) {
        //throw e;
        emit(InvoiceError(error: e));
      });
    } catch (e) {
      //rethrow;
      emit(InvoiceError(error:e.toString()));
    }
  }
  List<InvoiceApiModel> filterStatementsByDate(List<InvoiceApiModel> statements, DateTime startDate, DateTime endDate) {
    List<InvoiceApiModel> filteredStatements = [];

    for (InvoiceApiModel statement in statements) {
      if (statement.postingDate != null) {
        DateTime statementDate =DateFormat("MM/dd/yyyy").parse(statement.postingDate.toString());



        if (statementDate.isAfter(startDate) && statementDate.isBefore(endDate)) {
          filteredStatements.add(statement);
        }
      }
    }

    return filteredStatements;
  }
}
