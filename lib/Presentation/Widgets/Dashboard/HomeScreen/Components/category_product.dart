import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Data/DataSource/Resources/utils.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/image_widgets.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/Controller/category_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Product/product.dart';
import 'package:shimmer/shimmer.dart';

class CategoryProduct extends StatefulWidget {
 final PageController? pageController;
 final bool? isGuest;
  const CategoryProduct({super.key, this.pageController, this.isGuest});

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<CategoryCubit>().getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {


        // if (state is CategoryLoading) {
        //   //print("in loading");
        //   LoadingDialog.showLoadingDialog(context);
        // }
        // if (state is CategoryLoaded) {
        //   Navigator.of(context).pop(true);
        // }
      },
  builder: (context, state) {
        if(state is CategoryLoaded) {
          return SizedBox(
      height: 115,
      width: 1.sw,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
      //  shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){

        return GestureDetector(
          onTap:(){
            ///not used
Utils.productTitle.value=Utils.categoryDummyProduct[index].productName.toString();
print(state.categoryData[index].catId);
///used
            Navigate.to(context, ProductScreen(title:  state.categoryData[index].cat.toString(),isGuest: widget.isGuest,catId:state.categoryData[index].catId.toString()));

//pageController?.jumpToPage(2);


          },
          child: SizedBox(
            height: 105.sp,
            width: 106.sp,
//color: index==0?Colors.red:Colors.black,
            child: Column(

              children: [

                AssetImageWidget(url: Utils.categoryDummyProduct[index].productImage.toString(),isCircle: true,radius: 35.sp,),
              CustomSizedBox.height(5),
                Expanded(
                  child: AppText( state.categoryData[index].cat.toString(),maxLine: 2, style: Styles.circularStdRegular(context,
                      fontSize: 12.sp,

                      fontWeight: FontWeight.w600,color: Colors.black)),
                )
              ],

            ),
          ),
        );

      }, separatorBuilder: (context,index){

        return index!=0?CustomSizedBox.width(0):CustomSizedBox.width(0);

      }, itemCount: state.categoryData.length),
    );
        }
        else if(state is CategoryLoading)
          {
            return   SizedBox(
              height: 115,
              width: 1.sw,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  //  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){

                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: GestureDetector(
                        onTap:(){
                          ///not used
                          // Utils.productTitle.value=Utils.categoryDummyProduct[index].productName.toString();
                          // print(state.categoryData[index].catId);
                          // ///used
                          // Navigate.to(context, ProductScreen(title:  state.categoryData[index].cat.toString(),isGuest: widget.isGuest,catId:state.categoryData[index].catId.toString()));

//pageController?.jumpToPage(2);


                        },
                        child: SizedBox(
                          height: 105.sp,
                          width: 106.sp,
//color: index==0?Colors.red:Colors.black,
                          child: Column(

                            children: [

                              AssetImageWidget(url: Utils.categoryDummyProduct[index].productImage.toString(),isCircle: true,radius: 35.sp,),
                              CustomSizedBox.height(5),
                              Expanded(
                                child: AppText( 'categories',maxLine: 2, style: Styles.circularStdRegular(context,
                                    fontSize: 12.sp,

                                    fontWeight: FontWeight.w600,color: Colors.grey)),
                              )
                            ],

                          ),
                        ),
                      ),
                    );

                  }, separatorBuilder: (context,index){

                return index!=0?CustomSizedBox.width(0):CustomSizedBox.width(0);

              }, itemCount: 7),
            );
          }
        else
          {
            return const SizedBox();
          }
  },
);
  }
}
