import 'package:bloc/bloc.dart';
import 'package:hbk/Domain/Models/Cart/cart_model.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/SqDb/cart_db.dart';
import 'package:meta/meta.dart';

part '../State/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  getAllCartItems()
  async {
    await Future.delayed(const Duration(milliseconds: 20));
    emit(CartLoading());
    try{

    List<CartModel> status= await  CartDatabase.cartDatabaseInstance.getAllCartItems();
    print("calledd the function");
    print(status.length);
    emit(CartLoaded(cartData:status));


  }
  catch (e)
    {
      emit(CartError());
    }
  }






}
