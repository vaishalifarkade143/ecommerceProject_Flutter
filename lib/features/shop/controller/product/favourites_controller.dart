import 'dart:convert';

import 'package:ecommerseproject/data/repositories/product/product_repository.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/utils/local_storage/storage_utility.dart';
import 'package:ecommerseproject/utils/popups/loader.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  //variable
  final favourites = <String, bool>{}.obs;

  //variable
  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  //Method to initialize favorites by reading from storage
  Future<void> initFavorites() async {
    // Read favorites from local storage and update the state
    // Example: favorites.value = await TLocalStorage.instance().readData<List<String>>('favorites') ?? [];
    final json = TLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
          storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId) {
    if(!favourites.containsKey(productId)){
      favourites[productId] = true;
      saveFavouritesToStorage();
      TLoaders.CustomToast(message: 'Product has been added to wishlist');
    } else {
      TLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      favourites.refresh();
      TLoaders.CustomToast(message: 'Product has been removed from wishlist');
    }
  }
  
  void saveFavouritesToStorage() {
    final encodedFavourites = json.encode(favourites);
    TLocalStorage.instance().saveData('favorites', encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async {
    return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList());
  }
}
