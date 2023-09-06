import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part '../State/update_cart_state.dart';

class UpdateCartCubit extends Cubit<UpdateCartState> {
  UpdateCartCubit() : super(UpdateCartInitial());



}
