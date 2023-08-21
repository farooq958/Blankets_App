

import 'package:flutter_bloc/flutter_bloc.dart';

class InOutCubit extends Cubit<Map<int,bool>> {
  InOutCubit() : super({});

  void inOut(Map<int,bool> inOutMap) {
    print("inout");
    print(inOutMap);
    Future.delayed(const Duration(milliseconds: 16));
    emit(Map.of(inOutMap));
  }
}
