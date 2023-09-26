import 'package:bloc/bloc.dart';
import 'package:hbk/Data/DataSource/Resources/api_constants.dart';
import 'package:hbk/Data/Repository/Product/product_repo.dart';
import 'package:hbk/Domain/Models/HomeScreen/product_model.dart';
import 'package:meta/meta.dart';

part '../State/all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit() : super(AllProductsInitial());

  getAllProducts({String? catId, bool? dispose, bool? isGuest}) async {
    if (dispose != null) {
      close();
    }
    await Future.delayed(const Duration(milliseconds: 16));
    emit(AllProductsLoading());
    try {
      await ProductRepo()
          .getProduct(catId != null && isGuest == true
              ? categoryProductUrl + catId
              : catId != null && isGuest == false
                  ? productAuthUrl + catId
                  : allProductGuestUrl)
          .then((value) {
        if (value.runtimeType != int && value.runtimeType == List<dynamic>) {
          var newArrivalData = List<ProductApiModel>.from(
              value.map((x) => ProductApiModel.fromMap(x)));

          print(newArrivalData.length.toString() + "apiproductlenthacas");

          emit(AllProductsLoaded(allProductsData: newArrivalData));
        } else if (value.runtimeType == int) {
          emit(LogOutProductState());
        } else {
          emit(
              AllProductsError(error: value['error'], status: value['status']));
        }
      }).catchError((e) {
        //throw e;
        emit(AllProductsError(error: e, status: 32));
      });
    } catch (e) {
      //rethrow;
      emit(AllProductsError(error: e.toString(), status: 32));
    }
  }
}
