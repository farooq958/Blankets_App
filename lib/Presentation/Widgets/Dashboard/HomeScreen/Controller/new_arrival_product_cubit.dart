import 'package:bloc/bloc.dart';
import 'package:hbk/Data/DataSource/Resources/api_constants.dart';
import 'package:hbk/Data/Repository/Product/product_repo.dart';
import 'package:hbk/Domain/Models/HomeScreen/product_model.dart';
import 'package:meta/meta.dart';

part '../State/new_arrival_product_state.dart';

class NewArrivalProductCubit extends Cubit<NewArrivalProductState> {
  NewArrivalProductCubit() : super(NewArrivalProductInitial());

  getNewArrivalProducts() async {


    await Future.delayed(const Duration(milliseconds: 16));
    emit(NewArrivalProductLoading());
    try {

      await ProductRepo().getProduct(newArrivalProductUrl).then((value) {


        var newArrivalData = List<ProductApiModel>.from(value.map((x) => ProductApiModel.fromMap(x)));

        emit(NewArrivalProductLoaded(newArrivalData:newArrivalData.take(15).toList()));

      }).catchError((e) {
        //throw e;
        emit(NewArrivalProductError(error: e));
      });
    } catch (e) {
      //rethrow;
      emit(NewArrivalProductError(error:e.toString()));
    }
  }
}
