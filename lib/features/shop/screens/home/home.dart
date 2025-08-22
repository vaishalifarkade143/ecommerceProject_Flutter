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
                actions: [IconButton(onPressed: (){}, icon: const Icon(Iconsax.shopping_bag))],
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
