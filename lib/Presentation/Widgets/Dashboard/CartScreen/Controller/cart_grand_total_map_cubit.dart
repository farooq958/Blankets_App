import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';



class CartGrandTotalMapCubit extends Cubit<Map<int,String>> {
  CartGrandTotalMapCubit() : super({});


  setGetMap(int key,String value,Map<int,String>stateMap2, { bool? fromRemove})
  async {
    var stateMap=stateMap2;
print("state value $value");
 Future.delayed(const Duration(milliseconds: 16)).then((val) async {

   if(fromRemove== true)
     {

       emit({});

     }
   else {
     if (stateMap.containsKey(key)) {
       stateMap.update(key, (value2) => value);
     }
     else {
       stateMap.addAll({key: value});
     }
     emit(stateMap);

   }   // double totalCtn=0;
   // for(var i in stateMap.entries)
   //   {
   //     totalCtn+= double.parse(i.value);
   //
   //   }
  print("state map $stateMap");
   //print("${totalCtn}total State ctn");

});






  }


}
