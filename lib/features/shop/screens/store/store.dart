
import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/appbar/tabbar.dart';
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

    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
              /// Search bar + Featured Brands + Grid
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      /// --- Featured Brands Section
                      TSectionHeading(title: 'Featured Brands', onPressed: () {}),

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
                              radious: 10,
                              showBorder: true,
                              borderColor: TColors.grey,
                              backgroundColor: Colors.transparent,
                              padding: const EdgeInsets.all(TSizes.sm),
                              margin: const EdgeInsets.only(top: TSizes.sm),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: TCircularImageUseInStore(
                                      image: brand.image,
                                      isNetworkImage: false,
                                      size: 32,
                                    ),
                                  ),
                                  const SizedBox(width: TSizes.spaceBtwItems / 2),

                                  /// Brand Info
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TBrandTitleTextWithVerifiredIcon(
                                          title: brand.name,
                                          brandTextSize: TextSizes.large,
                                        ),
                                        Text(
                                          '${brand.products} products',
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      // const SizedBox(height: TSizes.spaceBtwSections),
                    ],
                  ),
                ),
              ),

              /// TabBar pinned below the grid
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                toolbarHeight: 0,
                bottom: const TTabBar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Cloths')),
                    Tab(child: Text('Cosmetics')),
                  ],
                ),
              ),
            ];
          },

          /// Tab content
          body: TabBarView(
            children: [
              _buildTabContent("Sports Content"),
              _buildTabContent("Furniture Content"),
              _buildTabContent("Electronics Content"),
              _buildTabContent("Cloths Content"),
              _buildTabContent("Cosmetics Content"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(String title) {
    return Center(
      child: Text(title, style: const TextStyle(fontSize: 18)),
    );
  }
}
