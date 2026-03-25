// import 'package:ecommerseproject/utils/constants/colors.dart';
// import 'package:ecommerseproject/utils/constants/sizes.dart';
// import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
// import 'package:flutter/material.dart';

// class TVerticalImageText extends StatelessWidget {
//   const TVerticalImageText({
//     super.key,
//     required this.image,
//     required this.title,
//     this.textColor = TColors.white,
//     this.backgroundColor,
//     this.onTap,
//   });

//   final String image, title;
//   final Color textColor;
//   final Color? backgroundColor;
//   final void Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     return GestureDetector(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
//         child: Column(
//           children: [
//             // Circular Icon
//             Container(
//               width: 56,
//               height: 56,
//               padding: const EdgeInsets.all(TSizes.sm),
//               decoration: BoxDecoration(
//                 color: backgroundColor ?? (dark
//                     ? TColors.black
//                     : TColors.white),
//                 borderRadius: BorderRadius.circular(100),
//               ),
//               child: Center(
//                 child: Image(
//                   image: AssetImage(image),
//                   fit: BoxFit.cover,
//                   color:dark
//                     ? TColors.light
//                     : TColors.black,
//                 ),
//               ),
//             ),
//             const SizedBox(height: TSizes.spaceBtwItems / 2),
//             SizedBox(
//               width: 55,
//               child: Text(
//                 title,
//                 style: Theme.of(context)
//                     .textTheme
//                     .labelMedium!
//                     .apply(color: textColor),
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }






import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    // Check if image is valid (not empty and is a proper URL or asset path)
    final bool hasImage = image.trim().isNotEmpty;
    final bool isNetworkImage = hasImage && image.startsWith('http');

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            // Circular Icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? TColors.black : TColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: hasImage
                    ? (isNetworkImage
                        ? Image.network(
                            image,
                            fit: BoxFit.cover,
                            // Show exclamation if network image fails to load
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                              Iconsax.warning_2,
                              color: TColors.black,
                            ),
                          )
                        : Image.asset(
                            image,
                            fit: BoxFit.cover,
                            color: dark ? TColors.light : TColors.black,
                            // Show exclamation if asset image fails to load
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                             Iconsax.warning_2,
                              color: TColors.black,
                            ),
                          ))
                    // No image at all — show exclamation icon
                    :  Icon(
                        Icons.priority_high_rounded,
                        color: dark ? TColors.white : TColors.black,
                        size: 26,
                      ),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems / 2),

            // ✅ Centered title
            SizedBox(
              width: 55,
              child: Text(
                title,
                textAlign: TextAlign.center, // 👈 centered
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}