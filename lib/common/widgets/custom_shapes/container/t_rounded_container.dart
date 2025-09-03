import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radious =TSizes.cardRadiousLg,
      this.child,
      this.showBorder = false,
      this.borderColor = TColors.white,
      this.backgroundColor = TColors.borderPrimary,
      this.padding,
      this.margin});

  final double? width;
    final double? height;
  final double radious;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radious),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
