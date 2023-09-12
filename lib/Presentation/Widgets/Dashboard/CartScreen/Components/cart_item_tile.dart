import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Domain/Models/Cart/cart_model.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/cart_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/cart_grand_total_map_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/notifier.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/SqDb/cart_db.dart';

class CartItemTile extends StatelessWidget {
  // final CartItem? cartItem;
  final CartModel? cartDto;
  final Map<int, String> mapQuantity;
  final void Function(String)? onRemove;

  // final void Function(String)? getCurrentValue;
  final int? index;

  // List<ValueNotifier<int>> qNotifier;

  const CartItemTile({
    Key? key,
    // required this.cartItem,
    this.onRemove,
    this.cartDto,
    // this.getCurrentValue,
    this.index,
    required this.mapQuantity,
  }) : super(key: key);

  //ValueNotifier<int> qNotifier = ValueNotifier(0);

  // setGrandTotal() async {
  //   //print(double.parse(widget.cartDto!.productQuantity.toString()).toInt());
  //   qNotifier.value =
  //       double.parse(cartDto!.productQuantity.toString()).toInt();
  //   print('valuenoti');
  //   print(qNotifier.value);
  //
  //   // context.read<CartGrandTotalMapCubit>().setGetMap(
  //   //     index!.toInt(), qNotifier.value.toString(), mapQuantity);
  //
  //   // CartNotifier.grandSumTotalNotifier.value +=
  //   //     double.parse(widget.cartDto!.productPrice.toString()) *
  //   //         widget.qNotifier.value;
  //
  //   // print(double.parse(widget.cartDto!.productQuantity.toString()).toInt());
  //   // widget.qNotifier.value = double.parse(widget.cartDto!.productQuantity.toString()).toInt();
  //   // print('value');
  //   // print(widget.qNotifier.value);
  //   // CartNotifier.grandSumTotalNotifier.value+=double.parse(widget.cartDto!.productPrice.toString()) * widget.qNotifier.value;
  //
  //   //your code goes here
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    //  widget.getCurrentValue!('${double.parse(widget.cartDto!.productPrice.toString()) * widget.qNotifier.value}');
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 12,
              offset: Offset(0, 6),
              spreadRadius: 0,
            )
          ]),
      child: Padding(
        padding: EdgeInsets.only(top: 5.h, left: 10.w, bottom: 10.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CachedImage(
                  url: cartDto!.productImage.toString(),
                  // color: widget.cartItem!.image!.contains('appLogo.png')
                  //     ? AppColors.primaryColor

                  width: 80.w,
                  height: 80.h,
                ),
                CustomSizedBox.width(5.w),
                SizedBox(
                  width: 130.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        cartDto!.productName!,
                        style: Styles.circularStdMedium(context),
                        maxLine: 3,
                      ),
                      AppText(
                        'Pcs/Ctn : ${cartDto!.pcsCtn.toString()}',
                        style: Styles.circularStdMedium(context),
                        maxLine: 2,
                      ),
                      CustomSizedBox.height(5.h),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Rs ',
                                style: Styles.circularStdBold(context,
                                    fontSize: 16.sp)),
                            TextSpan(
                                text: cartDto!.productPrice!.split('.0').first,
                                style: Styles.circularStdBold(context,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                    color: AppColors.primaryColor)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h, left: 20.w),
                  child: CircleIconButton(
                    icon: Icons.close,
                    onPressed: () {
                      if (onRemove != null) {
                        onRemove!(
                          '${(double.parse(cartDto!.productPrice.toString()) *
                              double.parse(mapQuantity[index] ?? '0.0')) *
                              double.parse(cartDto!
                                  .pcsCtn
                                  .toString()
                                  .split(' ')
                                  .first)}',
                        );
                      }
                    },
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Total',
                        style: Styles.circularStdMedium(
                            context, fontSize: 16.sp),
                      ),
                      TextSpan(
                          text: ' Rs ',
                          style: Styles.circularStdBold(
                              context, fontSize: 16.sp)),
                      TextSpan(
                          text:
                          '${(double.parse(cartDto!.productPrice.toString()) *
                              double.parse(mapQuantity[index] ?? '0.0')) *
                              double.parse(cartDto!
                                  .pcsCtn
                                  .toString()
                                  .split(' ')
                                  .first)}',
                          style: Styles.circularStdBold(context,
                              fontWeight: FontWeight.w900, fontSize: 20.sp)),
                    ])),
                Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleIconButton(
                          isSvg: true,
                          svgIcon: Assets.minusIconSvg,
                          isBorderRequired: true,
                          svgIconHeight: 3.h,
                          svgIconWidth: 11.w,

                          // icon: Icons.remove,
                          onPressed: () async {
                            if (int.parse(mapQuantity[index]!.toString()) >=
                                2) {
                              //  qNotifier.value--;
                              CartNotifier.grandSumTotalNotifier.value -=
                              (double.parse(
                                  cartDto!.productPrice.toString()) *
                                  double.parse(cartDto!
                                      .pcsCtn
                                      .toString()
                                      .split(' ')
                                      .first));
                              CartNotifier.grandCtnNotifier.value--;

                              context.read<CartCubit>().getAllCartItems();
                              context.read<CartGrandTotalMapCubit>().setGetMap(
                                  index!.toInt(),
                                  (int.parse(mapQuantity[index]!.toString()) -
                                      1)
                                      .toString(),
                                  mapQuantity);
                              CartModel cm = CartModel(
                                  productId: cartDto!.productId.toString(),
                                  productName: cartDto!.productName.toString(),
                                  productQuantity: ((int.parse(
                                      mapQuantity[index]!.toString()) -
                                      1)
                                      .toString()),
                                  productPrice:
                                  cartDto!.productPrice.toString(),
                                  multiplier: cartDto!.multiplier.toString(),
                                  productImage:
                                  cartDto!.productImage.toString(),
                                  pcsCtn: cartDto!.pcsCtn.toString());
                              await CartDatabase.cartDatabaseInstance
                                  .updateCart(cm);
                              //setState(() {});

                              //  context.read<CartCubit>().getAllCartItems();
                            }
                          },
                          width: 25.w,
                          height: 25.h,
                        ),
                        CustomSizedBox.width(10.w),
                        AppText(
                            (int.parse(mapQuantity[index] ?? '0')).toString(),
                            style: Styles.circularStdMedium(context)),
                        CustomSizedBox.width(10.w),
                        CircleIconButton(
                          // icon: Icons.add,
                          isSvg: true,
                          svgIcon: Assets.plusIcon,

                          onPressed: () async {
                            if ((int.parse(mapQuantity[index]!.toString())) <=
                                49) {
                              //  qNotifier.value++;
                              CartNotifier.grandSumTotalNotifier.value +=
                              (double.parse(
                                  cartDto!.productPrice.toString()) *
                                  double.parse(cartDto!
                                      .pcsCtn
                                      .toString()
                                      .split(' ')
                                      .first));
                              CartNotifier.grandCtnNotifier.value++;

                              context.read<CartCubit>().getAllCartItems();
                              context.read<CartGrandTotalMapCubit>().setGetMap(
                                  index!.toInt(),
                                  ((int.parse(mapQuantity[index]!.toString()) +
                                      1)
                                      .toString()),
                                  mapQuantity);
                              CartModel cm = CartModel(
                                  productId: cartDto!.productId.toString(),
                                  productName: cartDto!.productName.toString(),
                                  productQuantity: ((int.parse(
                                      mapQuantity[index]!.toString()) +
                                      1)
                                      .toString()),
                                  productPrice:
                                  cartDto!.productPrice.toString(),
                                  multiplier: cartDto!.multiplier.toString(),
                                  productImage:
                                  cartDto!.productImage.toString(),
                                  pcsCtn: cartDto!.pcsCtn.toString());
                              await CartDatabase.cartDatabaseInstance
                                  .updateCart(cm);
                              //  setState(() {});
                            }
                          },
                          width: 25.w,
                          height: 25.h,
                          svgIconHeight: 9.h,
                          svgIconWidth: 15.w,
                          color: AppColors.primaryColor,
                          iconColor: AppColors.whiteColor,
                        )
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
