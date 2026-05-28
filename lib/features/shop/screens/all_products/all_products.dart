import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/products/sortable/sortable_products.dart';
import 'package:ecommerseproject/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerseproject/features/shop/controller/all_products_controller.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    //  Initialize controller for managing products fetching
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                //check the state of the FutureBuilder snapshot
                const loader = TVerticalProductShimmer();
                final widget = TCloudHelperFunction.checkMultipleRecordsState(snapshot :snapshot , loader :loader, );
                
                // return  Appropriate widget based on the snapshot state
                if (widget != null) {
                  return widget;
                }
                

                //Products found !
                final products = snapshot.data!;

                return TSortebaleProducts(products: products);
              }),
        ),
      ),
    );
  }
}
