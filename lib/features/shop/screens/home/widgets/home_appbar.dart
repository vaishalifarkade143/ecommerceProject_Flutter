// import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
// import 'package:ecommerseproject/common/widgets/products/cart/cart_menu_icon.dart';
// import 'package:ecommerseproject/features/personalization/controller/user_controller.dart';
// import 'package:ecommerseproject/utils/constants/colors.dart';
// import 'package:ecommerseproject/utils/constants/text_strings.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class THomeAppBar extends StatelessWidget {
//   const THomeAppBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(UserController); // get the already-registered controller
//     return TAppBar(
//       title: Column(children: [
//         Text(
//           TTexts.homeAppbarTitle,
//           style: Theme.of(context)
//               .textTheme
//               .labelMedium!
//               .apply(color: TColors.grey),
//         ),
//             // Show real username reactively
//           Obx(() => Text(
//                 controller.isLoading.value
//                     ? 'Loading...'
//                     : controller.user.value.fullName.isNotEmpty
//                         ? controller.user.value.fullName
//                         : TTexts.homeAppbarSubTitle,
//                 style: Theme.of(context)
//                     .textTheme
//                     .headlineMedium!
//                     .apply(color: TColors.white),
//               )),
//         ],
//       ),
//       actions: [
//         CartCounterIcon(
//           onPressed: () {}, iconColor: TColors.white,
//         )
//       ],
//     );
//   }
// }

import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecommerseproject/features/personalization/controller/user_controller.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/text_strings.dart';
import 'package:ecommerseproject/utils/popups/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(UserController()); // get the already-registered controller
    return TAppBar(
      title: Column(
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          // Show real username reactively
          Obx(
            () {
              if (controller.profileLoading.value) {
                return TShimmerEffect(width: 80, height: 15);
              } else {
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.white),
                );
              }
            },
          ),
        ],
      ),
      actions: [
        CartCounterIcon(
          onPressed: () {},
          iconColor: TColors.white,
        )
      ],
    );
  }
}
