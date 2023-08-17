
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/BottomNavigationScreen/bottom_navigation_screen.dart';

class OrderSuccessFull extends StatelessWidget {
  final PageController? pageController;
  const OrderSuccessFull({Key? key,this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.orderSuccessFull),
            CustomSizedBox.height(10.h),
            AppText(AppStrings.orderSuccessFull,
                style: Styles.circularStdBold(context, fontSize: 22.sp)),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: AppText(
                AppStrings.orderSuccessFullNote,
                style: Styles.circularStdMedium(context, fontSize: 16.sp),
                maxLine: 2,
                textAlign: TextAlign.center,
              ),
            ),
            CustomSizedBox.height(20.h),
            CustomButton(
              borderRadius: 30.r,
              onTap: () {

          Navigator.of(context).pop();
          Navigator.of(context).pop();
          pageController!.jumpToPage(2);
              },
              text: 'Explore more products',
              leadingIcon: Assets.shoppingCart,
              bgColor: AppColors.whiteColor,
              textColor: AppColors.primaryColor,
              horizontalMargin: 15.w,
            ),
          ],
        ),
      ),
    );
  }
}
