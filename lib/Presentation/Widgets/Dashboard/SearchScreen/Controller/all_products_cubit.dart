import 'package:bloc/bloc.dart';
import 'package:hbk/Data/DataSource/Resources/api_constants.dart';
import 'package:hbk/Data/Repository/Product/product_repo.dart';
import 'package:hbk/Domain/Models/HomeScreen/product_model.dart';
import 'package:meta/meta.dart';

part '../State/all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit() : super(AllProductsInitial());

  getAllProducts({String? catId}) async {


    await Future.delayed(const Duration(milliseconds: 16));
    emit(AllProductsLoading());
    try {

      await ProductRepo().getProduct(catId!=null? categoryProductUrl+catId:allProductsUrl).then((value) {


        var newArrivalData = List<ProductApiModel>.from(value.map((x) => ProductApiModel.fromMap(x)));

        emit(AllProductsLoaded(allProductsData:newArrivalData));

      }).catchError((e) {
        //throw e;
        emit(AllProductsError(error: e));
      });
    } catch (e) {
      //rethrow;
      emit(AllProductsError(error:e.toString()));
    }
  }

}
