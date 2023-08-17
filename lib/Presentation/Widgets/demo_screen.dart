import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/Components/home_carousel.dart';

import 'Dashboard/HomeScreen/Components/new_arrival_product_widget.dart';
import 'Dashboard/Product/Components/product_detail.dart';
import 'Dashboard/Product/product.dart';

enum ScrollDirection { up, down, idle }

final ValueNotifier<bool> floatingButtonNotifier = ValueNotifier(false);
final ValueNotifier<double> scrollPositionNotifier = ValueNotifier(0.0);

class DemoScreen extends StatefulWidget {
  final bool? isGuest;

  const DemoScreen({Key? key, this.isGuest})
      : super(
          key: key,
        );

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  final _scrollController = ScrollController();
  double currentScrollPosition = 0.0;
  final ValueNotifier<bool> isScrolling = ValueNotifier(false);

  double _previousPosition = 0.0;
  ValueNotifier<ScrollDirection> scrollDirection =
      ValueNotifier(ScrollDirection.idle);
  ScrollDirection _scrollDirection = ScrollDirection.idle;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      currentScrollPosition = scrollPositionNotifier.value;
      scrollPositionNotifier.value = _scrollController.position.pixels;
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        floatingButtonNotifier.value = true;
      } else if (!_scrollController.position.outOfRange &&
          _scrollController.position.pixels < 100) {
        floatingButtonNotifier.value = false;
      }

      if (_scrollController.position.isScrollingNotifier.value) {
        isScrolling.value = true;
      } else {
        isScrolling.value = false;
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    floatingButtonNotifier.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: ValueListenableBuilder(
          valueListenable: floatingButtonNotifier,
          builder: (context, isVisible, child) {
            return Visibility(
                visible: isVisible,
                child: FloatingActionButton(
                  onPressed: () {
                    _scrollController.animateTo(0.0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut);
                  },
                  child: const Icon(Icons.arrow_upward),
                ));
          },
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: ValueListenableBuilder(
              valueListenable: scrollPositionNotifier,
              builder: (context, scrollPosition, child) {
                return Text('${scrollPosition.round()}');
              },
            ),
            actions: [
              ValueListenableBuilder(
                  valueListenable: isScrolling,
                  builder: (context, scrolling, child) {
                    return Text(
                        scrolling == true ? 'Scrolling' : 'Not Scrolling');
                  })
            ],
          ),
        ),
        backgroundColor: AppColors.whiteColor,

        //  drawer: Drawer(),

        // appBar: CustomAppBar(onBackTap: (){
        //   scaffoldKey.currentState!.openDrawer();
        //
        // },),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: _scrollController,
              child: Column(
                children: [
                  CustomSizedBox.height(10),

                  ///Top Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AppText(
                        AppStrings.accountBalance,
                        style: Styles.circularStdBold(context,
                            fontWeight: FontWeight.w500, fontSize: 16.sp),
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Rs ',
                            style: Styles.circularStdBold(context,
                                fontSize: 16.sp)),
                        TextSpan(
                            text: '50,490 ',
                            style: Styles.circularStdBold(context,
                                fontWeight: FontWeight.w900, fontSize: 20.sp)),
                      ]))
                    ],
                  ),
                  CustomSizedBox.height(20),

                  ///Home Coruosel sliding Images
                  const HomeCarousel(),
                  CustomSizedBox.height(5),

                  ///Category Product
                  Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        AppStrings.category,
                        style: Styles.circularStdBold(context,
                            fontWeight: FontWeight.w500, fontSize: 20.sp),
                      )),
                  CustomSizedBox.height(20),
                  // CategoryProduct(pageController: pageController,  isGuest: isGuest,),

                  ///New Arrival

                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          AppText(
                            AppStrings.newArrival,
                            style: Styles.circularStdBold(context,
                                fontWeight: FontWeight.w500, fontSize: 20.sp),
                          ),
                          const Spacer(),
                          widget.isGuest == true
                              ? const SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                              : GestureDetector(
                                  onTap: () {
                                    // pageController?.jumpToPage(2);
                                  },
                                  child: AppText(
                                    'See all',
                                    style: Styles.circularStdRegular(context,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp),
                                  ),
                                ),
                        ],
                      )),

                  ///to be continued ...
                  SizedBox(
                      width: 1.sw,
                      height: widget.isGuest == true ? 200.h : 260.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return NewArrivalProduct(
                            onDetailTap: () {
                              Navigate.to(
                                  context,
                                  ProductDetails(
                                    isGuest: widget.isGuest,
                                  ));
                            },
                            isGuest: widget.isGuest,
                            dummyProduct: Utils.dummyProduct[index],
                            onAddToCardTap: () {
                              if (widget.isGuest == true) {
                                CustomDialog.dialog(
                                    context,
                                    SizedBox(
                                        width: 1.sw,
                                        height: 200.h,
                                        child: Center(
                                          child: Column(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                Assets.logout,
                                                width: 50.w,
                                                height: 50.h,
                                              ),
                                              AppText('Please login first',
                                                  style: Styles.circularStdBold(
                                                      context,
                                                      fontSize: 22.sp)),
                                              AppText('Please login first',
                                                  style: Styles.circularStdBold(
                                                      context,
                                                      fontSize: 16.sp)),
                                              CustomSizedBox.height(10.h),
                                              CustomButton(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pop(true);
                                                },
                                                text: 'Login',
                                                width: 1.sw,
                                                horizontalMargin: 20.w,
                                              ),
                                            ],
                                          ),
                                        )));
                              }
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return CustomSizedBox.width(15);
                        },
                        itemCount: Utils.dummyProduct.length,
                      )),
                  SizedBox(
                      width: 1.sw,
                      height: widget.isGuest == true ? 200.h : 260.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return NewArrivalProduct(
                            onDetailTap: () {
                              Navigate.to(
                                  context,
                                  ProductDetails(
                                    isGuest: widget.isGuest,
                                  ));
                            },
                            isGuest: widget.isGuest,
                            dummyProduct: Utils.dummyProduct[index],
                            onAddToCardTap: () {
                              if (widget.isGuest == true) {
                                CustomDialog.dialog(
                                    context,
                                    SizedBox(
                                        width: 1.sw,
                                        height: 200.h,
                                        child: Center(
                                          child: Column(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                Assets.logout,
                                                width: 50.w,
                                                height: 50.h,
                                              ),
                                              AppText('Please login first',
                                                  style: Styles.circularStdBold(
                                                      context,
                                                      fontSize: 22.sp)),
                                              AppText('Please login first',
                                                  style: Styles.circularStdBold(
                                                      context,
                                                      fontSize: 16.sp)),
                                              CustomSizedBox.height(10.h),
                                              CustomButton(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pop(true);
                                                },
                                                text: 'Login',
                                                width: 1.sw,
                                                horizontalMargin: 20.w,
                                              ),
                                            ],
                                          ),
                                        )));
                              }
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return CustomSizedBox.width(15);
                        },
                        itemCount: Utils.dummyProduct.length,
                      )),
                  SizedBox(
                      width: 1.sw,
                      height: widget.isGuest == true ? 200.h : 260.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return NewArrivalProduct(
                            onDetailTap: () {
                              Navigate.to(
                                  context,
                                  ProductDetails(
                                    isGuest: widget.isGuest,
                                  ));
                            },
                            isGuest: widget.isGuest,
                            dummyProduct: Utils.dummyProduct[index],
                            onAddToCardTap: () {
                              if (widget.isGuest == true) {
                                CustomDialog.dialog(
                                    context,
                                    SizedBox(
                                        width: 1.sw,
                                        height: 200.h,
                                        child: Center(
                                          child: Column(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                Assets.logout,
                                                width: 50.w,
                                                height: 50.h,
                                              ),
                                              AppText('Please login first',
                                                  style: Styles.circularStdBold(
                                                      context,
                                                      fontSize: 22.sp)),
                                              AppText('Please login first',
                                                  style: Styles.circularStdBold(
                                                      context,
                                                      fontSize: 16.sp)),
                                              CustomSizedBox.height(10.h),
                                              CustomButton(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pop(true);
                                                },
                                                text: 'Login',
                                                width: 1.sw,
                                                horizontalMargin: 20.w,
                                              ),
                                            ],
                                          ),
                                        )));
                              }
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return CustomSizedBox.width(15);
                        },
                        itemCount: Utils.dummyProduct.length,
                      )),
                  SizedBox(
                      width: 1.sw,
                      height: widget.isGuest == true ? 200.h : 260.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return NewArrivalProduct(
                            onDetailTap: () {
                              Navigate.to(
                                  context,
                                  ProductDetails(
                                    isGuest: widget.isGuest,
                                  ));
                            },
                            isGuest: widget.isGuest,
                            dummyProduct: Utils.dummyProduct[index],
                            onAddToCardTap: () {
                              if (widget.isGuest == true) {
                                CustomDialog.dialog(
                                    context,
                                    SizedBox(
                                        width: 1.sw,
                                        height: 200.h,
                                        child: Center(
                                          child: Column(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                Assets.logout,
                                                width: 50.w,
                                                height: 50.h,
                                              ),
                                              AppText('Please login first',
                                                  style: Styles.circularStdBold(
                                                      context,
                                                      fontSize: 22.sp)),
                                              AppText('Please login first',
                                                  style: Styles.circularStdBold(
                                                      context,
                                                      fontSize: 16.sp)),
                                              CustomSizedBox.height(10.h),
                                              CustomButton(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pop(true);
                                                },
                                                text: 'Login',
                                                width: 1.sw,
                                                horizontalMargin: 20.w,
                                              ),
                                            ],
                                          ),
                                        )));
                              }
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return CustomSizedBox.width(15);
                        },
                        itemCount: Utils.dummyProduct.length,
                      )),

                  ///Most Sold Product replace the product dummy list with actual list of most sold product
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          AppText(
                            AppStrings.mostSoldProduct,
                            style: Styles.circularStdBold(context,
                                fontWeight: FontWeight.w500, fontSize: 20.sp),
                          ),
                          const Spacer(),
                          widget.isGuest == true
                              ? const SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                              : GestureDetector(
                                  onTap: () {
                                    // pageController?.jumpToPage(2);
                                  },
                                  child: AppText(
                                    'See all',
                                    style: Styles.circularStdRegular(context,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp),
                                  ),
                                ),
                        ],
                      )),
                  SizedBox(
                      width: 1.sw,
                      height: widget.isGuest == true ? 200.h : 250.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return NewArrivalProduct(
                            isGuest: widget.isGuest,
                            onDetailTap: () {
                              Navigate.to(
                                  context,
                                  ProductScreen(
                                    title: "",
                                    isGuest: widget.isGuest,
                                  ));
                            },
                            dummyProduct: Utils.dummyProduct[index],
                            onAddToCardTap: () {
                              if (widget.isGuest == true) {
                                CustomDialog.dialog(
                                    context,
                                    SizedBox(
                                        width: 1.sw,
                                        height: 250.h,
                                        child: Center(
                                          child: Column(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                Assets.logout,
                                                width: 50.w,
                                                height: 50.h,
                                              ),
                                              CustomSizedBox.height(10.h),
                                              AppText('Please login first',
                                                  style: Styles.circularStdBold(
                                                      context,
                                                      fontSize: 22.sp)),
                                              CustomSizedBox.height(10.h),
                                              AppText('Please login first',
                                                  style: Styles.circularStdBold(
                                                      context,
                                                      fontSize: 16.sp)),
                                              CustomSizedBox.height(10.h),
                                              CustomButton(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pop(true);
                                                  Navigate.to(context,
                                                      const LoginScreen());
                                                },
                                                text: 'Login',
                                                width: 1.sw,
                                                horizontalMargin: 20.w,
                                              ),
                                            ],
                                          ),
                                        )));
                              }
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return CustomSizedBox.width(15);
                        },
                        itemCount: Utils.dummyProduct.length,
                      )),
                  ValueListenableBuilder<double>(
                      valueListenable: scrollPositionNotifier,
                      builder: (context, position, child) {
                        return Text('${position.round()}');
                      }),
                  CustomSizedBox.height(5),
                ],
              ),
            )));
  }
}
