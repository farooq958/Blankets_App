import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Domain/Models/Order/orders_model.dart';

class OrderItemRow extends StatelessWidget {
  final Salesorderdetaila? item;

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
              SizedBox(
                  width: 40.w,
                  child: AppText(
                    "   ${item!.id}",
                    style: Styles.circularStdMedium(context, fontSize: 14.sp),
                    maxLine: 4,
                  )),
              CustomSizedBox.width(5.w),
              SizedBox(
                  width: 120.w,
                  child: AppText(
                    item!.itemName!,
                    style: Styles.circularStdMedium(context, fontSize: 14.sp),
                    maxLine: 4,
                  )),
            ],
          ),
          AppText(item!.quantity!, style: Styles.circularStdMedium(context)),
          // AppText('PKR ${item!.amount.toStringAsFixed(2)}',
          //     style: Styles.circularStdMedium(context)),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'PKR ',
                style: Styles.circularStdBold(context, fontSize: 15.sp)),
            TextSpan(
                text: item!.price,
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
