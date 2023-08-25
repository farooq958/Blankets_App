import 'package:bloc/bloc.dart';
import 'package:hbk/Data/Repository/Category/category_repo.dart';
import 'package:hbk/Domain/Models/HomeScreen/category_api_model.dart';
import 'package:meta/meta.dart';

part '../State/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());


  getCategories() async {


    await Future.delayed(const Duration(milliseconds: 16));
    emit(CategoryLoading());
    try {

      await CategoryRepo().getCategoryData().then((value) {


        var categoryData = List<CategoryModel>.from(value.map((x) => CategoryModel.fromMap(x)));

        emit(CategoryLoaded(categoryData:categoryData));

      }).catchError((e) {
        //throw e;
        emit(CategoryError(error: e));
      });
    } catch (e) {
      //rethrow;
      emit(CategoryError(error:e.toString()));
    }
  }
}
