import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/Repository/SliderImagesRepo/slider_images_repo.dart';
import 'package:hbk/Domain/Models/SliderImages/slider_images.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/SliderImages/State/slider_images_state.dart';

class SliderImagesCubit extends Cubit<SliderImagesState> {
  SliderImagesCubit() : super(SliderImagesInitial());

  Future getImages() async {
    emit(SliderImagesLoading());
    try {
      await SliderImagesRepo().getSliderImages().then((value) {
        print(value);

        if (value.runtimeType == List<dynamic>) {
          var sliderImages = List<SliderImages>.from(
              value.map((x) => SliderImages.fromJson(x)));

          emit(SliderImagesLoaded(sliderImages));
        } else if (value.runtimeType == int) {
        } else {
          print('valueeeeee');
          print(value);
          emit(SliderImagesError(value['error']));
        }
      }).catchError((e) {
        print("Errrorrrrrr $e");
        throw e;
        emit(SliderImagesError(e.toString()));
      });
    } catch (e) {
      print("Errrorrrrrr Catch $e");
      rethrow;
      emit(SliderImagesError(e.toString()));
    }
  }
}
