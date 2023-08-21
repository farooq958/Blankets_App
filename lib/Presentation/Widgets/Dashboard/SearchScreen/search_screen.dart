import 'package:hbk/Data/DataSource/Resources/imports.dart';

class SearchScreen extends  StatelessWidget {
   SearchScreen({super.key});
final TextEditingController searchController=SearchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(
        title: "Search",
        isNotificationScreen: true,isShowNotificationButton: true,),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(children: [
            CustomTextFieldWithOnTap(
                isShadowRequired: true,

                prefixIcon: SvgPicture.asset(Assets.searchIcon,color: AppColors.greyColor,) ,

                isBorderRequired: false,
                onChanged: (v){
                  ///tobe evaluated
                },

                borderRadius:20.sp,
                hintTextColor: AppColors.greyColor,
                controller: searchController, hintText: 'Search products', textInputType: TextInputType.text)


          ],),
        ),
      )
    );
  }
}
