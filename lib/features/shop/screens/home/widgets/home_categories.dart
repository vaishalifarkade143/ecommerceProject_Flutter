// import 'package:ecommerseproject/common/widgets/image_text_widgets/vertical_image_text.dart';
// import 'package:ecommerseproject/features/shop/screens/sub_category/sub_categories.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CategoryModel {
//   final String name;
//   final String icon;
//   CategoryModel({required this.name, required this.icon});
// }

// class THomeCategories extends StatelessWidget {
//   const THomeCategories({
//     super.key, required this.categories,
//   });

//    final List<CategoryModel> categories;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 80,
//       child: ListView.builder(
//         shrinkWrap: true,
//         itemCount: categories.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (_, index) {
//            final category = categories[index];
//           return  TVerticalImageText(
//              image: category.icon,
//             title: category.name,
//             onTap: () => Get.to(()=> SubCategoriesScreen()),);
//         },
//       ),
//     );
//   }
// }

import 'package:ecommerseproject/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:ecommerseproject/common/widgets/shimmer/category_shimmer.dart';
import 'package:ecommerseproject/features/shop/controller/category_controller.dart';
import 'package:ecommerseproject/features/shop/screens/sub_category/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  //  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) {
        return const TCategoryShimmer();
      }

      if(categoryController.featuredCategories.isEmpty){
        return  Center(child: Text('No Data found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)
        ));
      }

      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return TVerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => SubCategoriesScreen()),
            );
          },
        ),
      );
    });
  }
}
