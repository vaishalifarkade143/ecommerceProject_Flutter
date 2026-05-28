import 'package:ecommerseproject/features/shop/model/product_model.dart'; // ← ADD THIS
import 'package:ecommerseproject/features/shop/model/product_type.dart';

import 'package:ecommerseproject/utils/popups/loader.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/product/product_repository.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final isAllProductsLoading = false.obs;
  RxList<ProductModel> featuredProducts =
      <ProductModel>[].obs; // 1 per category
  RxList<ProductModel> allProducts = <ProductModel>[].obs;

  // Category IDs matching your dummy data
  static const List<String> _categoryIds = [
    'CAT1',
    'CAT2',
    'CAT3',
    'CAT4',
    'CAT5',
    'CAT6'
  ];

  // RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    // fetchFeaturedProducts();
    fetchOneProductPerCategory();
    super.onInit();
  }

  // ✅ Fetch 1 featured product per category for home screen
  void fetchOneProductPerCategory() async {
    try {
      isLoading.value = true;
      final products = await ProductRepository.instance
          .getOneProductPerCategory(_categoryIds);
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ✅ Fetch ALL products for View All screen
  Future<void> fetchAllProducts() async {
    try {
      isAllProductsLoading.value = true;
      final products = await ProductRepository.instance.getAllProducts();
      allProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      isAllProductsLoading.value = false;
    }
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
    Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      final products = await ProductRepository.instance.getFeaturedProducts();
      print('✅ All Products fetched: ${products.length}');
      return products;
    } catch (e) {
      print('❌ Fetch error: $e'); // ← ADD THIS
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
      return [];
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
