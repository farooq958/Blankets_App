import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/circle_icon_button.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/cart_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/Controller/new_arrival_product_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/PriceListScreen/price_list_screen.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/SearchScreen/Controller/all_products_cubit.dart';

///use padding optional property to set the child alignment plus if you use svg icon then make typeIconSvg true and pass the svgIconPath
class CustomAppBarWithBackButton extends StatefulWidget
    implements PreferredSizeWidget {
  const CustomAppBarWithBackButton(
      {Key? key,
      this.title,
      this.iconData,
      this.typeIconSvg,
      this.svgIconPath,
      this.iconSize,
      this.padding,
      this.iconColor,
      this.isBottom,
      this.catId,
      this.isGuest,
      this.fromPriceList,
      this.exceptional})
      : preferredSize = const Size.fromHeight(65),
        super(key: key);
  final String? title;
  final IconData? iconData;
  final bool? typeIconSvg;
  final String? svgIconPath;
  final double? iconSize;
  final Color? iconColor;
  final bool? isBottom;
  final String? catId;
  final bool? fromPriceList;
  final bool? isGuest;
  final bool? exceptional;
  final EdgeInsetsGeometry? padding;

  @override
  State<CustomAppBarWithBackButton> createState() =>
      _CustomAppBarWithBackButtonState();

  @override
  final Size preferredSize;
}

class _CustomAppBarWithBackButtonState
    extends State<CustomAppBarWithBackButton> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 8,
      shadowColor: Colors.black12,
      backgroundColor: AppColors.whiteColor,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: AppText(
        widget.title ?? 'Test',
        style: Styles.circularStdBold(context,
            fontSize: 20.sp, fontWeight: FontWeight.w500),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, top: 8, left: 8),
        child: widget.typeIconSvg != null
            ? SvgPicture.asset(
                widget.svgIconPath.toString(),
              )
            : CircleIconButton(
                icon: widget.iconData ?? Icons.arrow_back_ios,
                padding: widget.padding ?? EdgeInsets.only(left: 5.sp),
                iconColor: widget.iconColor ?? AppColors.primaryColor,
                iconSize: widget.iconSize ?? 15,
                isSvg: widget.typeIconSvg,

                onPressed: () async {
                  if (widget.exceptional != null) {
                    Navigate.pop(context);
                  }
                  if (widget.isGuest == false && widget.fromPriceList == null) {
                    context.read<AllProductsCubit>().getAllProducts(
                        catId: widget.catId ?? 'all', isGuest: widget.isGuest);
                    context
                        .read<NewArrivalProductCubit>()
                        .getNewArrivalProducts();
                    Navigator.of(context).pop();
                  } else if (widget.isGuest == true) {
                    Navigator.of(context).pop();
                  }
                  if (widget.fromPriceList == true) {
                    await context
                        .read<AllProductsCubit>()
                        .getAllProducts(catId: 'all', isGuest: false);
                    await Future.delayed(const Duration(milliseconds: 30));
                    Navigate.toReplace(context, const PriceListScreen());
                  }

                  // context.read<AllProductsCubit>().getAllProducts();
                },
                width: 15.w,
                // iconSize: 15,
                height: 15.h,
              ),
      ),
      bottom: widget.isBottom != null
          ? TabBar(
              labelStyle:
                  Styles.circularStdMedium(context, color: Colors.black26),
              labelColor: AppColors.primaryColor,
              indicatorColor: AppColors.primaryColor,
              tabs: const [
                  Tab(text: 'Active'),
                  Tab(text: 'Pending'),
                  Tab(text: 'Completed'),
                ])
          : null,
    );
  }
}
