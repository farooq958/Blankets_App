import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/custom_dropdown.dart';

class FilterBottomSheetWidget extends StatefulWidget {
  const FilterBottomSheetWidget({super.key});

  @override
  State<FilterBottomSheetWidget> createState() => _FilterBottomSheetWidgetState();
}

class _FilterBottomSheetWidgetState extends State<FilterBottomSheetWidget> {
  double slideValue=0.0;
  List<String> categoryList = ['category1', 'category2', "category3"];
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return  Align(

      alignment: Alignment.centerLeft,
      child:  Column(
        children: <Widget>[

          Align(
            alignment: Alignment.centerLeft,
            child: AppText('Price Range', style: Styles.circularStdRegular(context,letterSpacing: 1.1,fontWeight:
            FontWeight.w600,fontSize: 16.sp),),
          ),
          Material(
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
                  AppText('25000', style: Styles.circularStdBold(context,color: AppColors.greyLightColor),),
                ],
              ),
            ),
          ),
          Padding(
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

              Expanded(child: CustomButton(onTap: (){}, text: 'Clear All',bgColor: Colors.transparent,textColor: AppColors.greyColor,
borderColor: AppColors.greyColor,
                verticalPadding: 15,

              )),
              Expanded(child: CustomButton(onTap: (){}, text: 'Apply'

              , verticalPadding: 15,
              )),

            ],
          ),


        ],
      ),

    );
  }
}
