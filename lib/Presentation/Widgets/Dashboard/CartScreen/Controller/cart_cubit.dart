import 'package:bloc/bloc.dart';
import 'package:hbk/Domain/Models/Cart/cart_model.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/SqDb/cart_db.dart';
import 'package:meta/meta.dart';

part '../State/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  getAllCartItems({bool? isReload}) async {
    await Future.delayed(const Duration(milliseconds: 25));
    if (isReload == null) {
      emit(CartLoading());
    }
    try {
      List<CartModel> status =
          await CartDatabase.cartDatabaseInstance.getAllCartItems();
      print("calledd the function");
      print(status.length);
      emit(CartLoaded(cartData: status));
    } catch (e) {
      emit(CartError());
    }
  }
}
