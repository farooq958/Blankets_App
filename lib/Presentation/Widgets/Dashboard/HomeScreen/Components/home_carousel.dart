import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/api_constants.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/image_widgets.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/SliderImages/Controller/slider_images_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/SliderImages/State/slider_images_state.dart';
import 'package:shimmer/shimmer.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  final List<String> imageList = [
    "assets/images/babyImage.png",
    "assets/images/babyImage.png",
    "assets/images/babyImage.png",
  ];

  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    // TODO: implement initState

    context.read<SliderImagesCubit>().getImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocConsumer<SliderImagesCubit, SliderImagesState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is SliderImagesLoaded) {
              print(
                  "$baseUrl/Picture/CustomerApplogin/${state.loadedImages[0]
                      .uImage?.trim()
                      .toString()}");
              return CarouselSlider.builder(
                itemCount: imageList.length,
                itemBuilder: (context, index, realIndex) {
                  return CachedImage(
                      isCircle: false,
                      url:
                      "$baseUrl/Picture/CustomerApplogin/${state
                          .loadedImages[index].uImage?.trim().toString()}",
                      width: 1.sw / 1);
                },
                carouselController: _carouselController,
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              );
            } else if (state is SliderImagesLoading) {
              return CarouselSlider.builder(
                itemCount: 1,
                itemBuilder: (context, index, realIndex) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: CachedImage(
                        isCircle: false,
                        url:
                        "http://imtxt.sbsolutions.com.pk:44891/Picture/CustomerApplogin/slider_01_image_01.jpeg",
                        width: 1.sw / 1), // Create a ShimmerListTile widget
                  );
                },
                // carouselController: _carouselController,
                options: CarouselOptions(
                  // autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    // setState(() {
                    //   _currentIndex = index;
                    // });
                  },
                ),
              );
            } else if (state is SliderImagesError) {
              return const SizedBox();
            }
            return const SizedBox();
          },
        ),

        BlocBuilder<SliderImagesCubit, SliderImagesState>(
          builder: (context, state) {
            if (state is SliderImagesLoaded) {
              return Column(
                children: [
                  const SizedBox(height: 16),
                  buildIndicators(imageList.length),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }

  Widget buildIndicators(int length) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
            (index) =>
            Container(
              width: 15,
              height: 3,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: ShapeDecoration(
                color:
                index == _currentIndex ? const Color(0xFF0C4A9F) : Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
      ),
    );
  }
}
