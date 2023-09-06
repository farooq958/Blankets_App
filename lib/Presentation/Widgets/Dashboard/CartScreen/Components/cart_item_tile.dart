
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Domain/Models/Cart/cart_model.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/cart_grand_total_map_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/notifier.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/SqDb/cart_db.dart';

class CartItemTile extends StatefulWidget {
  final CartItem? cartItem;
  final CartModel? cartDto;
  final Map<int,String> mapQuantity;
  final void Function(String)? onRemove;
  final void Function(String)? getCurrentValue;
final int? index;
  const CartItemTile({Key? key, required this.cartItem, this.onRemove, this.cartDto, this.getCurrentValue, this.index, required this.mapQuantity})
      : super(key: key);

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}


class _CartItemTileState extends State<CartItemTile> {
   ValueNotifier<int> quantityNotifier=ValueNotifier(0);
   @override
  void initState() {
    // TODO: implement initState


setGrandTotal();

     // widget.getCurrentValue!('${double.parse(widget.cartDto!.productPrice.toString()) * quantityNotifier.value}');
    super.initState();
  }
setGrandTotal()
 async {



   print(double.parse(widget.cartDto!.productQuantity.toString()).toInt());
   quantityNotifier.value =
       double.parse(widget.cartDto!.productQuantity.toString()).toInt();
   print('value');
   print(quantityNotifier.value);

     context.read<CartGrandTotalMapCubit>().setGetMap(widget.index!.toInt(),quantityNotifier.value.toString(),widget.mapQuantity);


   // CartNotifier.grandSumTotalNotifier.value +=
   //     double.parse(widget.cartDto!.productPrice.toString()) *
   //         quantityNotifier.value;





    // print(double.parse(widget.cartDto!.productQuantity.toString()).toInt());
    // quantityNotifier.value = double.parse(widget.cartDto!.productQuantity.toString()).toInt();
    // print('value');
    // print(quantityNotifier.value);
    // CartNotifier.grandSumTotalNotifier.value+=double.parse(widget.cartDto!.productPrice.toString()) * quantityNotifier.value;

    //your code goes here
  // });
}
  @override
  Widget build(BuildContext context) {
     print('rebuild');
     widget.getCurrentValue!('${double.parse(widget.cartDto!.productPrice.toString()) * quantityNotifier.value}');
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
        ]
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 5.h, left: 10.w, bottom: 10.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CachedImage(
                  url: widget.cartDto!.productImage.toString(),
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
                        widget.cartDto!.productName!,
                        style: Styles.circularStdMedium(context),
                        maxLine: 3,
                      ),
                      AppText(
                        'Pcs/Ctn : ${widget.cartDto!.pcsCtn.toString()}',
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
                                text: widget.cartDto!.productPrice!.split('.0').first,
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
                      if(widget.onRemove != null){
                        widget.onRemove!(quantityNotifier.value.toString());
                      }
                    },
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
              ],
            ),
            BlocBuilder<CartGrandTotalMapCubit, Map<int,String>>(
  builder: (context, qState) {

    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'Total',
                    style: Styles.circularStdMedium(context, fontSize: 16.sp),
                  ),
                  TextSpan(
                      text: ' Rs ',
                      style:
                          Styles.circularStdBold(context, fontSize: 16.sp)),
                  TextSpan(
                      text: '${double.parse(widget.cartDto!.productPrice.toString()) *double.parse( widget.mapQuantity[widget.index].toString())}',
                      style: Styles.circularStdBold(context,
                          fontWeight: FontWeight.w900, fontSize: 20.sp)),
                ])),
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: ValueListenableBuilder(
                    builder: (context,state,child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleIconButton(
                            isSvg:true,
                            svgIcon: Assets.minusIconSvg,
                            isBorderRequired:true,
                            svgIconHeight: 3.h,
                            svgIconWidth: 11.w,

                            // icon: Icons.remove,
                            onPressed: () async {
if( quantityNotifier.value!=0) {
  quantityNotifier.value--;
  await context.read<CartGrandTotalMapCubit>().setGetMap(widget.index!.toInt(),quantityNotifier.value.toString(),widget.mapQuantity);

  CartModel cm = CartModel(productId:widget.cartDto!.productId.toString(),
      productName: widget.cartDto!.productName.toString(),productQuantity: (quantityNotifier.value.toString()) ,
      productPrice: widget.cartDto!.productPrice.toString() ,
      multiplier: widget.cartDto!.multiplier.toString(),
      productImage:widget.cartDto!.productImage.toString(),
      pcsCtn:widget.cartDto!.pcsCtn.toString());
  await CartDatabase.cartDatabaseInstance.updateCart(cm);
  setState(() {

  });
  print(quantityNotifier.value.toString() +"from minuss");

  CartNotifier.grandSumTotalNotifier.value -= double.parse(widget.cartDto!.productPrice.toString());
  CartNotifier.grandCtnNotifier.value--;

}

                            },
                            width: 25.w,
                            height: 25.h,
                          ),
                          CustomSizedBox.width(10.w),
                          AppText(state.toString(),
                              style: Styles.circularStdMedium(context)),
                          CustomSizedBox.width(10.w),
                          CircleIconButton(
                            // icon: Icons.add,
                            isSvg:true,
                            svgIcon: Assets.plusIcon,

                            onPressed: () async {

                              quantityNotifier.value++;
                              context.read<CartGrandTotalMapCubit>().setGetMap(widget.index!.toInt(),quantityNotifier.value.toString(),widget.mapQuantity);

                              CartModel cm = CartModel(productId:widget.cartDto!.productId.toString(),
                                  productName: widget.cartDto!.productName.toString(),productQuantity: (quantityNotifier.value.toString()) ,
                                  productPrice: widget.cartDto!.productPrice.toString() ,
                                  multiplier: widget.cartDto!.multiplier.toString(),
                                  productImage:widget.cartDto!.productImage.toString(),
                                  pcsCtn:widget.cartDto!.pcsCtn.toString());
                              await CartDatabase.cartDatabaseInstance.updateCart(cm);
                              setState(() {

                              });

                              CartNotifier.grandSumTotalNotifier.value += double.parse(widget.cartDto!.productPrice.toString());
                              CartNotifier.grandCtnNotifier.value++;
                            },
                            width: 25.w,
                            height: 25.h,
                            svgIconHeight: 9.h,
                            svgIconWidth: 15.w,
                            color: AppColors.primaryColor,
                            iconColor: AppColors.whiteColor,
                          )
                        ],
                      );
                    }, valueListenable: quantityNotifier,
                  ),
                )
              ],
            );
  },
)
          ],
        ),
      ),
    );
  }
}
