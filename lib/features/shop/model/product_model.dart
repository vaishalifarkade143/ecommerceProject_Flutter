import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseproject/features/shop/model/brand_model.dart';
import 'package:ecommerseproject/features/shop/model/product_attribute_model.dart';
import 'package:ecommerseproject/features/shop/model/product_variation_model.dart';

class ProductModel {
  String id;
  String title;
  int stock;
  double price;
  String thumbnail;
  String productType;
  String? sku;
  BrandModel? brand;
  DateTime? date;
  List<String>? images;
  double salePrice;
  bool? isFeatured;
  String? categoryID;
  String? description;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    this.productType = 'simple',
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salePrice = 0.0,
    this.isFeatured,
    this.categoryID,
    this.description,
    this.productAttributes,
    this.productVariations,
  });

  ///Create empty func for clean code
  static ProductModel empty() => ProductModel(
      id: '', title: '', stock: 0, price: 0.0, thumbnail: '', productType: '');

  /// Json format
  toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryID': categoryID,
      'Description': description,
      'ProductType': productType,
      'Brand': brand?.toJson(),
      'Images': images ?? [],
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'ProductVariations': productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : [],
    };
  }

  /// Map JsonOriented data to Model
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    if (data.isEmpty) return ProductModel.empty();
    return ProductModel(
      id: document.id,
      title: data['Title'],
      stock: data['Stock'] ?? 0,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      productType: data['ProductType'] ?? '',
      sku: data['Sku'],
      // brand:  BrandModel.fromJson(data['Brand']),
      brand: data['Brand'] != null ? BrandModel.fromJson(data['Brand']) : null,
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      isFeatured: data['IsFeatured'] ?? false,
      categoryID: data['CategoryID'] ?? '',
      description: data['Description'] ?? '',
      productAttributes: (data['ProductAttributes'] as List<dynamic>?)
          ?.map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>?)
          ?.map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }

  /// Map JsonOriented document snapshot from Firestore to model
  factory ProductModel.fromQuerySnapShot(
      QueryDocumentSnapshot<Object> document) {
    final data = document.data() as Map<String, dynamic>;
    if (data.isEmpty) return ProductModel.empty();
    return ProductModel(
      id: document.id,
      title: data['Title'],
      stock: data['Stock'] ?? 0,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      productType: data['ProductType'] ?? '',
      sku: data['Sku'],
      // brand:  BrandModel.fromJson(data['Brand']),
      brand: data['Brand'] != null ? BrandModel.fromJson(data['Brand']) : null,
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      isFeatured: data['IsFeatured'] ?? false,
      categoryID: data['CategoryID'] ?? '',
      description: data['Description'] ?? '',
      productAttributes: (data['ProductAttributes'] as List<dynamic>?)
          ?.map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>?)
          ?.map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }
}
