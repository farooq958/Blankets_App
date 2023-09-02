


import 'package:hbk/Domain/Models/SliderImages/slider_images.dart';

abstract class SliderImagesState {
  SliderImagesState();
}

class SliderImagesInitial extends SliderImagesState{
  SliderImagesInitial();
}

class SliderImagesLoading extends SliderImagesState{
  SliderImagesLoading();
}

class SliderImagesError extends SliderImagesState{
  final String error;
  SliderImagesError(this.error);
}

class SliderImagesLoaded extends SliderImagesState{
  final List<SliderImages> loadedImages;

  SliderImagesLoaded(this.loadedImages);
}