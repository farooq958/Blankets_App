import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';



class CartGrandTotalMapCubit extends Cubit<Map<int,String>> {
  CartGrandTotalMapCubit() : super({});


  setGetMap(int key,String value,Map<int,String>stateMap)
  async {
print("state value $value");
 Future.delayed(const Duration(milliseconds: 16)).then((value) async {

  if(stateMap.containsKey(key))
  {
   stateMap.update(key, (value) => value);
  }
  else
  {
    if(value != null) {
      stateMap.addAll({key:value});
    }
  }
  emit(stateMap);
});






  }


}
