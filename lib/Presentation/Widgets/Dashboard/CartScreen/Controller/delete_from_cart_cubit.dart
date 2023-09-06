import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part '../State/delete_from_cart_state.dart';

class DeleteFromCartCubit extends Cubit<DeleteFromCartState> {
  DeleteFromCartCubit() : super(DeleteFromCartInitial());
}
