
import 'package:hbk/Data/DataSource/Resources/imports.dart';


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
