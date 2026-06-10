import 'package:ecommerseproject/features/shop/controller/product/images_controller.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/features/shop/model/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  // ADD THESE 3 lines
  RxInt quantity = 1.obs;
  void increaseQuantity() => quantity.value++;
  void decreaseQuantity() {
    if (quantity.value > 1) quantity.value--;
  }

  //variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel?> selectedVariation =
      ProductVariationModel.empty().obs;
  // -- Get product stock status

 

  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    // ✅ Try full match first
    final selectedVariation = product.productVariations!.firstWhere(
        (variation) => _isSameAttributeValues(
            variation.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());

    // ✅ If full match found, update image from variation
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImages.value =
          selectedVariation.image;
    } else {
      // ✅ Partial match — find any variation that has this attribute value
      // so image updates even before all attributes are selected
      final partialMatch = product.productVariations!.firstWhere(
        (variation) =>
            variation.attributeValues[attributeName] == attributeValue &&
            variation.image.isNotEmpty,
        orElse: () => ProductVariationModel.empty(),
      );
      if (partialMatch.image.isNotEmpty) {
        ImagesController.instance.selectedProductImages.value =
            partialMatch.image;
      }
    }

    this.selectedVariation.value = selectedVariation;
    getProdutVariationStockStatus();
  }

  //-- check if selected attributes match variation attributes
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    ///If selectedAttributes contains  3 attributes and current varation contain 2 then return
    if (variationAttributes.length != selectedAttributes.length) return false;

    //if any of the attributes is  diff
    for (final key in variationAttributes.keys) {
      //Attribute[Key] = Value which could be [Green ,small ,Control etc]
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  /// --check Attribute availability /stock in variention
  // Set<String?> getAttributesAvailabilityInVariation(
  Set getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    //pass the variations to check if the attribute is available in any of the variations
    final availableVariationAttributesValues = variations
        .where((variation) =>
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        //fetch all non-empty attributes of variations
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();
    return availableVariationAttributesValues;
  }

  String getVariationPrice() {
    return (selectedVariation.value!.salePrice > 0
            ? selectedVariation.value!.salePrice
            : selectedVariation.value!.price)
        .toString();
  }

  /// -- Get product Vatiation stock status
  void getProdutVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value!.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  /// -- Reset Selected Attributes when switching product
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
    quantity.value = 1;
  }
}
