import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          PrimaryHeaderContainer(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TAppBar(
                title: Column(children: [
                  Text(
                    TTexts.homeAppbarTitle,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(color: TColors.grey),
                  ),
                  Text(
                    TTexts.homeAppbarSubTitle,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: TColors.white),
                  ),
                ]),
                actions: [
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.shopping_bag,
                          color: TColors.white,
                        ),
                      ),
                      Positioned(
                        right:0,
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            color: TColors.black,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                              child: Text('2',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(color: TColors.white, fontSizeFactor: 0.8))),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ))
        ],
      ),
    ));
  }
}

// import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
// import 'package:ecommerseproject/common/widgets/custom_shapes/container/primary_header_container.dart';
// import 'package:ecommerseproject/utils/constants/colors.dart';
// import 'package:ecommerseproject/utils/constants/text_strings.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             PrimaryHeaderContainer(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TAppBar(
//                     title: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           TTexts.homeAppbarTitle,
//                           style: Theme.of(context)
//                               .textTheme
//                               .labelMedium!
//                               .apply(color: TColors.grey),
//                         ),
//                         Text(
//                           TTexts.homeAppbarSubTitle,
//                           style: Theme.of(context)
//                               .textTheme
//                               .headlineSmall!
//                               .apply(color: TColors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // 👇 put the rest of your body here
//             const SizedBox(height: 100, child: Center(child: Text("Home Content"))),
//           ],
//         ),
//       ),
//     );
//   }
// }
