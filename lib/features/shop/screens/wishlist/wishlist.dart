import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/icons/t_circular_icon.dart';
import 'package:ecommerseproject/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerseproject/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerseproject/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:ecommerseproject/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerseproject/features/shop/controller/product/favourites_controller.dart';
import 'package:ecommerseproject/features/shop/controller/product/product_controller.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/features/shop/screens/home/home.dart';
import 'package:ecommerseproject/navigation_menu.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(()=>
            FutureBuilder(
              future: controller.favouriteProducts(),
              builder: (context, snapshot) {
                //Nothing FoundWidget
                final emptyWidget = TAnimationLoaderWidget(
                  text: " Whoops! Wishlist is empty!",
                  animation: TImages.userProfileImage1,
                  showAction: true,
                  actionText: "Let's Add some!",
                  onActionPressed: () => Get.off(() => NavigationMenu()),
                );
                const loader = TVerticalProductShimmer(itemCount: 6);
                final widget = TCloudHelperFunction.checkMultipleRecordsState(
                    snapshot: snapshot,
                    loader: loader,
                    nothingFound: emptyWidget);
                if (widget != null) return widget;
                final products = snapshot.data!;
                return TGridLayout(
                  itemCount: products.length,
                  itemBuilder: (_, index) => TProductCardVertical(
                    product: products[index],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
