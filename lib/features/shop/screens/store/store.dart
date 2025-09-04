

import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/custom_shapes/container/search_container.dart';
import 'package:ecommerseproject/common/widgets/custom_shapes/container/t_rounded_container.dart';
import 'package:ecommerseproject/common/widgets/images/t_circular_image_use_in_store.dart';
import 'package:ecommerseproject/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerseproject/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
import 'package:ecommerseproject/common/widgets/texts/t_brand_title_text_with_verifired_icon.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/enum.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Store',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          CartCounterIcon(
            onPressed: () {},
            iconColor: dark ? TColors.white : TColors.black,
          )
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: dark ? TColors.black : TColors.white,
              expandedHeight: 30,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(
                    left: TSizes.defaultSpace, right: TSizes.defaultSpace),
                child: const TSearchContainer(
                  text: 'Search in Store',
                  showBorder: true,
                  showBackground: false,
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ];
        },
        body: ListView(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          children: [
            /// --- Featured Brands Section
            TSectionHeading(title: 'Featured Brands', onPressed: () {}),
            // const SizedBox(height: TSizes.spaceBtwItems / 1.5),
            TGridLayout(
                itemCount: 4,
                mainAxisExtent:70,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: TRoundedContainer(
                      width: 60,
                      height: 60,
                      radious: 10, // 👈 set custom border radius here
                      showBorder: true, // optional: if you also want a border
                      borderColor: TColors.grey,
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.all(TSizes.sm),
                      margin: const EdgeInsets.only(top: TSizes.sm),
                      child: Row(children: [
                        Flexible(
                          child: TCircularImageUseInStore(image: TImages.clothIcon,),
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems / 2),
                        // -- Example text
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TBrandTitleTextWithVerifiredIcon(
                                  title: 'Shein', brandTextSize: TextSizes.large),
                              Text(
                                '230 products ghfytfyhj',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                            ],
                          ),
                        )
                      ]),

                      ///-- Text
                    ),
                  );
                }),

            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}


