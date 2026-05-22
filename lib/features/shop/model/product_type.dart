enum ProductType { single, variable }

extension ProductTypeExtension on ProductType {
  String tostring() {
    switch (this) {
      case ProductType.single:
        return 'single';
      case ProductType.variable:
        return 'variable';
    }
  }
}