import 'package:bloc/bloc.dart';
import 'package:hbk/Data/Repository/Orders/orders_repo.dart';
import 'package:meta/meta.dart';

part '../State/post_order_state.dart';

class PostOrderCubit extends Cubit<PostOrderState> {
  PostOrderCubit() : super(PostOrderInitial());

  Future postOrder(Map<String,dynamic>orderData) async {

    emit(PostOrderLoading());
    try {
      await OrdersRepo.postOrders(orderData).then((value) {

        if(value==200){
          emit(PostOrderSuccess());

        }
        else{
          print(value);
          emit(PostOrderError(value['error']));
        }
      }).catchError((e) {
        // throw e;
        emit(PostOrderError(e.toString()));
      });
    } catch (e) {
     // rethrow;
      emit(PostOrderError(e.toString()));
    }
  }

}
