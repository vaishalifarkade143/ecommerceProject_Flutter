class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String>? attributesValues; // Map of attribute name to value

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description,
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributesValues,
  });

  ///create empty func for clean code
  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributesValues: {});

  ///Json format
  Map<String, Object?> toJson() {
    return {
      'Id': id,
      'Sku': sku,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'Stock': stock,
      'AttributesValues': attributesValues,
    };
  }

  ///Map JsonOriented data to Model
  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: data['Id'] ?? '',
      sku: data['Sku'] ?? '',
      image: data['Image'] ?? '',
      description: data['Description'],
      // price: (data['Price'] ?? 0).toDouble(),
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      stock: data['Stock'] ?? 0,
      attributesValues:
          Map<String, String>.from(data['AttributesValues'] ?? {}),
    );
  }
}
