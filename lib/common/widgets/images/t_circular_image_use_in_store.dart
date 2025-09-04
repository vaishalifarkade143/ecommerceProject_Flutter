import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCircularImageUseInStore extends StatelessWidget {
  const TCircularImageUseInStore({
    super.key,
    required this.image,
    this.isNetworkImage = false,
    this.size = 56,
    this.fit = BoxFit.contain,
    this.overlayColor,
    this.backgroundColor,
    this.alignment = Alignment.center,
  });

  final String image;
  final bool isNetworkImage;
  final double size;
  final BoxFit fit;
  final Color? overlayColor;
  final Color? backgroundColor;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ??
            (dark ? TColors.dark : TColors.light), // default background
      ),
      child: Align(
        alignment: alignment,
        child: Image(
          image: isNetworkImage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
          fit: fit,
          color: overlayColor ?? (dark ? TColors.white : TColors.dark),
        ),
      ),
    );
  }
}
