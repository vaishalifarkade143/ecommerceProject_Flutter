import 'package:ecommerseproject/features/shop/controller/product/variation_controller.dart';
import 'package:ecommerseproject/features/shop/model/cart_item_model.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/features/shop/model/product_type.dart';
import 'package:ecommerseproject/utils/local_storage/storage_utility.dart';
import 'package:ecommerseproject/utils/popups/loader.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  //variable
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController() {
    loadCartItems();
  }

  //Add  items in the cart

  void addToCart(ProductModel product) {
    // 1. Quantity check
    if (variationController.quantity.value < 1) {
      TLoaders.CustomToast(message: 'Select Quantity');
      return;
    }

    // 2. For variable products — must select a variation FIRST
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value == null ||
          variationController.selectedVariation.value!.id.isEmpty) {
        TLoaders.warningSnackbar(
            message: 'Please select a variation.', title: 'Oh Snap!');
        return;
      }
      // 3. Then check if that variation is in stock
      if (variationController.selectedVariation.value!.stock < 1) {
        TLoaders.warningSnackbar(
            title: 'Oh snap!', message: 'Selected variation is out of stock.');
        return;
      }
    } else {
      // 4. Single product stock check
      if (product.stock < 1) {
        TLoaders.warningSnackbar(
            message: 'Selected Product is out of stock', title: 'Oh snap!');
        return;
      }
    }

    // 5. Add to cart
    final selectedCartItem =
        convertToCartItem(product, variationController.quantity.value);
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }
    updateCart();
    TLoaders.CustomToast(message: 'Your Product has been added to the Cart.');
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);
    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        //show dialog before completely removing
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this Product? ',
      onConfirm: () {
        //Remove the item from the cart
        cartItems.removeAt(index);
        updateCart();
        TLoaders.CustomToast(message: 'Product removed from the Cart');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    //if product has no variations then calculate cartEntries and display total number
    //Else make  default entries to 0 and  show  cartEntries when variaton is selected
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      //Get selected variation if any..
      // final variationId = variationController.selectedVariation.value!.id;
      // if(variationId.isEmpty){
      //   productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);
      // }
      // else{
      //   productQuantityInCart.value = 0;
      // }

      final variation = variationController.selectedVariation.value;
      final variationId = variation?.id ?? '';
      if (variationId.isNotEmpty) {
        // show count only when a variation IS selected
        productQuantityInCart.value =
            getVariationQuantityInCart(product.id, variationId);
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }

  /// This function convert a ProductModel to a  CartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      //Reset Variation in case  of single product type
      variationController.resetSelectedAttributes();
    }
    final variation = variationController.selectedVariation.value;
    final isVariation = variation != null && variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      variationId: isVariation ? variation.id : '',
      quantity: quantity,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributesValues : null,
    );
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }
    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    TLocalStorage.instance().saveData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings =
        TLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
      (item) => item.productId == productId && item.variationId == variationId,
      orElse: () => CartItemModel.empty(),
    );
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
