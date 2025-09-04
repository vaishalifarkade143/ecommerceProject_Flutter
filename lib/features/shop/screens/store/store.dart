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

class BrandModel {
  final String name;
  final String image;
  final int products;

  BrandModel({
    required this.name,
    required this.image,
    required this.products,
  });
}

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    /// --- Sample Data
    final List<BrandModel> brands = [
      BrandModel(name: "Shein", image: TImages.clothIcon, products: 230),
      BrandModel(name: "Nike", image: TImages.shoeIcon, products: 150),
      BrandModel(name: "Adidas", image: TImages.sportIcon, products: 180),
      BrandModel(name: "Tiger", image: TImages.animalIcon, products: 95),
    ];

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

            /// --- Grid of Brands
            TGridLayout(
                itemCount: brands.length,
                mainAxisExtent: 70,
                itemBuilder: (_, index) {
                  final brand = brands[index];
                  return GestureDetector(
                    onTap: () {
                      debugPrint("Tapped on ${brand.name}");
                    },
                    child: TRoundedContainer(
                      // width: 60,
                      // height: 60,
                      radious: 10, // 👈 set custom border radius here
                      showBorder: true, // optional: if you also want a border
                      borderColor: TColors.grey,
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.all(TSizes.sm),
                      margin: const EdgeInsets.only(top: TSizes.sm),
                      child: Row(children: [
                        Flexible(
                          child: 
                            /// Brand Image
                          TCircularImageUseInStore(
                            image: brand.image,
                            isNetworkImage: false,
                            size: 48,
                          ),
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems / 2),
                         /// Brand Info
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TBrandTitleTextWithVerifiredIcon(
                                  title: brand.name,
                                  brandTextSize: TextSizes.large),
                              Text(
                                '${brand.products} products',
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
