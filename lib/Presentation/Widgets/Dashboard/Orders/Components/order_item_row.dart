import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Domain/Models/Order/order_item.dart';
import 'package:hbk/Presentation/Common/app_text.dart';

class OrderItemRow extends StatelessWidget {
  final OrderItem? item;

  const OrderItemRow({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                item!.image,
                height: 50.h,
                width: 50.w,
                color: AppColors.primaryColor,
              ),
              CustomSizedBox.width(5.w),
              SizedBox(
                  width: 120.w,
                  child: AppText(
                    item!.itemTitle,
                    style: Styles.circularStdMedium(context, fontSize: 14.sp),
                    maxLine: 4,
                  )),
            ],
          ),
          AppText(item!.itemCount.toString(),
              style: Styles.circularStdMedium(context)),
          // AppText('PKR ${item!.amount.toStringAsFixed(2)}',
          //     style: Styles.circularStdMedium(context)),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'PKR ',
                style: Styles.circularStdBold(context, fontSize: 15.sp)),
            TextSpan(
                text: item!.amount.toString(),
                style: Styles.circularStdBold(context,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp,
                    color: AppColors.primaryColor)),
          ]))
        ],
      ),
    );
  }
}
