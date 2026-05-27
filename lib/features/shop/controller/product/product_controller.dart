import 'package:ecommerseproject/features/shop/model/product_model.dart'; // ← ADD THIS
import 'package:ecommerseproject/features/shop/model/product_type.dart';

import 'package:ecommerseproject/utils/popups/loader.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/product/product_repository.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;

  // ProductRepository get productRepository => ProductRepository.instance;
  // final productRepository = Get.put(ProductRepository());

  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;
      final products = await ProductRepository.instance.getFeaturedProducts();
      print('✅ Products fetched: ${products.length}'); // ← ADD THIS
      featuredProducts.assignAll(products);
    } catch (e) {
      print('❌ Fetch error: $e'); // ← ADD THIS
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  ///Get the product price or price range for variable
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      ///calculate price range for variable product
      // for(var variation in product.productVariations!){
      //   // Determine the price to use (salePrice if available, otherwise regular price)
      //   double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

      //   //Update smallest and largest prices
      //   if(priceToConsider < smallestPrice){
      //     smallestPrice = priceToConsider;
      //   }
      //   if(priceToConsider > largestPrice){
      //     largestPrice = priceToConsider;
      //   }

      //   //if smallest and largest prices are the same, return single price, otherwise return price range
      //   if(smallestPrice.isEqual(largestPrice)){
      //     return largestPrice.toString();
      //   }
      //   else{
      //     return '$smallestPrice - \$$largestPrice';
      //   }

      // ✅ correct — loop fully, then return
      for (var variation in product.productVariations!) {
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;
        if (priceToConsider < smallestPrice) smallestPrice = priceToConsider;
        if (priceToConsider > largestPrice) largestPrice = priceToConsider;
      }
// return AFTER loop completes
      return smallestPrice == largestPrice
          ? largestPrice.toString()
          : '\$$smallestPrice - \$$largestPrice';

      return '';
    }
  }

  //calculate price range for variable product
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) {
      return null;
    }
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return '-${percentage.toStringAsFixed(0)}%';
  }

  /// -- check  Product  Stock status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
