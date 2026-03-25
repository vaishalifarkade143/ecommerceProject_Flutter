import 'package:ecommerseproject/data/repositories/categories/category_repository.dart';
import 'package:ecommerseproject/features/shop/model/category_model.dart';
import 'package:ecommerseproject/utils/popups/loader.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
   RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchCategories();
    super.onInit();
  }

  /// -- Load category data
  Future<void> fetchCategories() async {
    try {
      // show lader while loading categories
      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();
      // Update the observable list with fetched categories
      allCategories.assignAll(categories);
      // print('Fetched Categories: ${categories.length}');

      // Hide loader after loading categories
      //fetch data from data source(Firestore, api etc)
      //Filter fetched categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    
    } catch (e) {
      // print('Error fetching categories: $e');
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }

  /// -- Load selected category data
  ///  -- Get category or sub -category Products.
}
