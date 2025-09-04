import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage(
      {super.key,
      this.width = 56,
      this.height = 56,
      this.padding = TSizes.sm,
      required this.image,
      this.isNetworkImage = false,
      this.overlayColor,
      this.fit = BoxFit.cover,
      this.backgroundColor});

  final double width, height; 
  final double padding;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final BoxFit? fit;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (THelperFunctions.isDarkMode(context)
                ? TColors.black
                : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
          child: Image(
        fit: fit,
        image: isNetworkImage
            ? NetworkImage(image)
            : AssetImage(image) as ImageProvider,
         color: overlayColor,
      )),
    );
  }
}
