import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/custom_dropdown.dart';

class FilterBottomSheetWidget extends StatefulWidget {
   final bool? isGuest;
  const FilterBottomSheetWidget({super.key, this.isGuest});

  @override
  State<FilterBottomSheetWidget> createState() => _FilterBottomSheetWidgetState();
}

class _FilterBottomSheetWidgetState extends State<FilterBottomSheetWidget> {
  double slideValue=0.0;
  List<String> categoryList = ['category1', 'category2', "category3"];
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return  Padding(

      padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 20),
      child:  SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CustomSizedBox.height(40.sp),
            Align(
              alignment: Alignment.centerLeft,
              child: AppText('Filters', style: Styles.circularStdBold(context,letterSpacing: 1.1,fontWeight:
              FontWeight.w600,fontSize: 19.sp),),
            ),
            CustomSizedBox.height(40.sp),
           widget.isGuest==true?SizedBox(height: 0.sp,width: 0.sp,): Align(
              alignment: Alignment.centerLeft,
              child: AppText('Price Range', style: Styles.circularStdRegular(context,letterSpacing: 1.1,fontWeight:
              FontWeight.w600,fontSize: 16.sp),),
            ),
            widget.isGuest==true?SizedBox(height: 0.sp,width: 0.sp,): Material(
              color: Colors.transparent,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [

                    AppText('0', style: Styles.circularStdBold(context,color: AppColors.greyLightColor),),
                    Expanded(
                      flex: 2,
                      child: SliderTheme(
                        data: const SliderThemeData(
                          showValueIndicator: ShowValueIndicator.always,
                          activeTrackColor: AppColors.primaryColor, // Dark blue active color
                          inactiveTrackColor: AppColors.greyLightColor, // Light grey inactive color
                          thumbColor: AppColors.primaryColor, // Dark blue thumb color
                        ),
                        child: Slider(
                          min: 0,
                          max: 250000,
                          //secondaryTrackValue: 0.1,
                          value: slideValue,
                            label: 'Value: $slideValue',
                          onChanged: (newValue) {
                            setState(() {
                              slideValue = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                    AppText('250,000', style: Styles.circularStdBold(context,color: AppColors.greyLightColor),),
                  ],
                ),
              ),
            ),
            widget.isGuest==true?SizedBox(height: 0.sp,width: 0.sp,):  Padding(
              padding:  EdgeInsets.only(right: 30.0.sp),
              child: AppText('${slideValue.toInt()}', style: Styles.circularStdRegular(context,color: AppColors.greyLightColor),),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: AppText('Categories', style: Styles.circularStdRegular(context,letterSpacing: 1.1,fontWeight:
              FontWeight.w600,fontSize: 16.sp),),
            ),
            CustomSizedBox.height(10),
            Material(
              color: Colors.transparent,
              child: CustomDropDownWidget(
                isBorderRequired: true,




                prefixIcon: null, hintText: 'Categories', value: selectedCategory, validationText: 'Please Select Category', onChanged: (value) {  }, itemsMap: [

                for (int i = 0; i < categoryList.length; i++)
                  DropdownMenuItem(
                    value: categoryList[i],
                    child: AppText(
                      categoryList[i],
                      style: Styles.circularStdBold(context, fontSize: 12.sp),
                    ),
                  ),

              ],),



            ),
            CustomSizedBox.height(30),
             Row(
              children: <Widget>[

                Expanded(child: CustomButton(onTap: (){},
                  borderRadius: 30,
                  text: 'Clear All',bgColor: Colors.transparent,textColor: AppColors.greyColor,
borderColor: AppColors.greyColor,
                  verticalPadding: 10.sp,

                )),
                Expanded(child: CustomButton(onTap: (){}, text: 'Apply'

                , verticalPadding: 10.sp,
                  borderRadius: 30.sp,
                )),

              ],
            ),


          ],
        ),
      ),

    );
  }
}
