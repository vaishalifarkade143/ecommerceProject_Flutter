class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({
    this.name,
    this.values,
  });

  //Json format
  toJson() {
    return {
      'Name': name,
      'Values': values,
    };
  }

  //Map JsonOriented data to Model
  factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductAttributeModel();
    return ProductAttributeModel(
      // name: data['Name'] ? data['Name'] : '',
      // values: List<String>.from(data['Values']),
      name: data.containsKey('Name') ? data['Name'] : '', // ✅ safer way to access keys
      // name: data['Name'] ?? '', // ✅ ?? instead of ternary
      values: List<String>.from(data['Values'] ), // ✅ null-safe
    );
  }
}
