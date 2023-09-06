import 'package:bloc/bloc.dart';
import 'package:hbk/Domain/Models/Cart/cart_model.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/SqDb/cart_db.dart';
import 'package:meta/meta.dart';

part '../State/add_cart_state.dart';

class AddCartCubit extends Cubit<AddCartState> {
  AddCartCubit() : super(AddCartInitial());


  addToCart(CartModel cm)
  async {
    emit(AddCartLoading());
    var status= await  CartDatabase.cartDatabaseInstance.insertCart(cm);
    if(status >0)
      {
        emit(AddCartLoaded());
      }
    else
      {
        emit(AddCartError());
      }


  }


}
