
import 'package:hbk/Data/DataSource/Resources/imports.dart';

class EmptyCartScreen extends StatelessWidget {
  final PageController? pageController;

  const EmptyCartScreen({Key? key, this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.cart),
                  CustomSizedBox.height(20.h),
                  AppText('Your cart is empty',
                      style: Styles.circularStdBold(context, fontSize: 22.sp)),
                  CustomSizedBox.height(10.h),
                  AppText(
                    'Explore different products and buy your favourite one',
                    style: Styles.circularStdMedium(context),
                    maxLine: 2,
                    textAlign: TextAlign.center,
                  ),
                  CustomSizedBox.height(30.h),
                  CustomButton(
                    onTap: () {
                      pageController?.jumpToPage(2);


                    },
                    text: 'Explore',
                    leadingIcon: Assets.shoppingCart,
                    bgColor: AppColors.whiteColor,
                    textColor: AppColors.primaryColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
