import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/Repository/Orders/orders_repo.dart';
import 'package:hbk/Domain/Models/Order/orders_model.dart';

part '../State/orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  getOrders() {
    emit(OrdersLoading());
    try {
      OrdersRepo.getOrders().then((value) {
        if (value == 600) {
          emit(OrdersError(error: 'Record Not Found'));
        } else if (value == 401) {
          emit(OrdersError(error: 'Un Authorized'));
        } else {
          var orderData = List<OrdersApiModel>.from(
              value.map((x) => OrdersApiModel.fromJson(x)));
          emit(OrdersLoaded(model: orderData));
        }
      }).catchError((e) {
        print(e.toString());
        emit(OrdersError(error: e.toString()));
      });
    } catch (e) {
      emit(OrdersError(error: e.toString()));
    }
  }
}
