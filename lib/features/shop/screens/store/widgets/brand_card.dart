// import 'package:ecommerseproject/common/widgets/custom_shapes/container/t_rounded_container.dart';
// import 'package:ecommerseproject/common/widgets/images/t_circular_image_use_in_store.dart';
// import 'package:ecommerseproject/common/widgets/texts/t_brand_title_text_with_verifired_icon.dart';
// import 'package:ecommerseproject/features/shop/model/brand_model.dart';
// import 'package:ecommerseproject/utils/constants/colors.dart';
// import 'package:ecommerseproject/utils/constants/enum.dart';
// import 'package:ecommerseproject/utils/constants/sizes.dart';
// import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
// import 'package:flutter/material.dart';

// class TBrandCard extends StatelessWidget {
//   const TBrandCard(
//       {super.key, required this.showBorder, this.onTap, required this.brand});

//   final BrandModel brand;
//   final bool showBorder;
//   final void Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     final isDark = THelperFunctions.isDarkMode(context);
//     return GestureDetector(
//       onTap: onTap,
//       child: TRoundedContainer(
//         radious: 10,
//         showBorder: true,
//         borderColor: TColors.grey,
//         backgroundColor: Colors.transparent,
//         padding: const EdgeInsets.all(TSizes.sm),
//         margin: const EdgeInsets.only(top: TSizes.sm),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Flexible(
//               child: TCircularImageUseInStore(
//                 image: brand.image,
//                 isNetworkImage: true,
//                 backgroundColor: Colors.transparent,
//                 overlayColor: isDark ? TColors.white : TColors.black,
//                 size: 32,
//               ),
//             ),
//             const SizedBox(width: TSizes.spaceBtwItems / 2),

//             /// Brand Info
//             Expanded(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TBrandTitleTextWithVerifiredIcon(
//                     title: brand.name,
//                     brandTextSize: TextSizes.large,
//                   ),
//                   Text(
//                     '${brand.productCount} products',
//                     overflow: TextOverflow.ellipsis,
//                     style: Theme.of(context).textTheme.labelMedium,
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }




import 'package:ecommerseproject/common/widgets/custom_shapes/container/t_rounded_container.dart';
import 'package:ecommerseproject/common/widgets/images/t_circular_image.dart';
import 'package:ecommerseproject/common/widgets/texts/t_brand_title_text_with_verifired_icon.dart';
import 'package:ecommerseproject/features/shop/model/brand_model.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/enum.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.brand,
    required this.showBorder,
    this.onTap,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(TSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: TCircularImage(
                image: brand.image,
                isNetworkImage: true,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleTextWithVerifiredIcon(
                    title: brand.name,
                    brandTextSize: TextSizes.large,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${brand.productCount ?? 0} products',
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}