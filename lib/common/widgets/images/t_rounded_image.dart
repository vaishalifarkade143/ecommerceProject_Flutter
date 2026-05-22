import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerseproject/common/widgets/shimmer/shimmer.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadious = true,
    this.border,
    this.backgroundColor = TColors.white,
    this.fit,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadious = TSizes.md,
  });
  final double? width, height;
  final String imageUrl;
  final bool applyImageRadious;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadious;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: border,
          borderRadius: BorderRadius.circular(borderRadious),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadious
              ? BorderRadius.circular(borderRadious)
              : BorderRadius.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: fit,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      TShimmerEffect(
                         width: width ?? double.infinity , height: height ?? 158,),
                         errorWidget: (context, url , error) => const Icon(Icons.error,),
                          
                )
              : Image(
                  image: isNetworkImage
                      ? NetworkImage(imageUrl)
                      : AssetImage(imageUrl) as ImageProvider,
                  fit: fit,
                ),
        ),
      ),
    );
  }
}
