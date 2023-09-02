import 'package:bloc/bloc.dart';
import 'package:hbk/Data/Repository/InvoiceRepo/invoice_repo.dart';
import 'package:hbk/Domain/Models/Invoice/invoice_detail_api_model.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/InvoiceScreen/Component/invoice_details.dart';
import 'package:meta/meta.dart';

part '../State/invoice_detail_state.dart';

class InvoiceDetailCubit extends Cubit<InvoiceDetailState> {
  InvoiceDetailCubit() : super(InvoiceDetailInitial());

  getInvoiceDetail(invoiceNumber) async {


    await Future.delayed(const Duration(milliseconds: 16));
    emit(InvoiceDetailLoading());
    try {

      await InvoiceRepo().getInvoicesDetails(invoiceNumber).then((value) {

        if(value.runtimeType != int) {
          var rewardDto = List<InvoiceDetailApiModel>.from(
              value.map((x) => InvoiceDetailApiModel.fromMap(x)));
          // Utils.dashData=dashData;
          List<InvoiceDetailModel> actualInvoiceData= [];
          double totalCtn=0.0;
          double totalPcs=0.0;
          double grandTotal=0.0;
          for(var i in rewardDto)
          {

            totalCtn+= double.parse(i.quantity.toString());
            totalPcs+= double.parse(i.invQty.toString());
            grandTotal+= double.parse(i.lineTotal.toString());

            actualInvoiceData.add(InvoiceDetailModel(productName: i.description.toString(),type: i.goodstype.toString(),packing: i.packing.toString()

            ,
              ctn: i.quantity.toString(),pcs: i.invQty,unitPrice: i.price.toString(),totalPrice: i.lineTotal.toString(),
              customerName: i.cardName.toString(),contactPerson: i.contactPer.toString(),phoneNumber: i.cell.toString(),
              address: i.address.toString(),createdBy: i.createdBy.toString(),status: i.pStatus.toString(),invoiceNo: i.docEntry.toString()
                ,date: i.docDate!.split(' ').first.toString(),salePerson: i.salesPerson.toString()
            ));

          }

          emit(InvoiceDetailLoaded(rawData: rewardDto,actualInvoiceData:actualInvoiceData, totalCtn: totalCtn, totalPcs: totalPcs, grandTotal: grandTotal));
        }
        else
        {
          emit(InvoiceDetailLogOutState());
        }
      }).catchError((e) {
        //throw e;
        emit(InvoiceDetailError(error: e));
      });
    } catch (e) {
      //rethrow;
      emit(InvoiceDetailError(error:e.toString()));
    }
  }
}
