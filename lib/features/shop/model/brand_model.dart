// import 'package:cloud_firestore/cloud_firestore.dart';

// class BrandModel {
//   String id;
//   String name;
//   String image;
//   bool? isFeatured;
//   int? productCount;

//   BrandModel({
//     required this.id,
//     required this.name,
//     required this.image,
//     this.isFeatured,
//     this.productCount,
//   });
//   // Empty Helper Function
//   static BrandModel empty() => BrandModel(
//         id: '',
//         name: '',
//         image: '',
//       );

//   /// Convert model to Json Structure so that you can store data in firebase
//   toJson() {
//     return {
//       'Id': id,
//       'Name': name,
//       'Image': image,
//       'IsFeatured': isFeatured,
//       'ProductCount': productCount,
//     };
//   }

//   factory BrandModel.fromJson(Map<String, dynamic> document) {
//     final data = document;
//     if (data.isEmpty) return BrandModel.empty();
//     return BrandModel(
//       id: data['Id'] ?? '',
//       name: data['Name'] ?? '',
//       image: data['Image'] ?? '',
//        isFeatured: data['IsFeatured'] == true,
//       // ✅ safely handle null ProductCount
//       productCount: data['ProductCount'] != null
//           ? int.tryParse(data['ProductCount'].toString()) ?? 0
//           : 0,
//     );
//     // productCount: int.parse((data['ProductCount'] ?? 0).toString()),
//     // );
//   }

//   //Map Json oriented document snapShot from firebase to userModel
//   factory BrandModel.fromSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> document) {
//     if (document.data() != null) {
//       final data = document.data()!;
//       return BrandModel(
//         id: document.id,
//         name: data['Name'] ?? '',
//         image: data['Image'] ?? '',
//         isFeatured: data['IsFeatured'] == true,
//         // productCount: int.parse((data['ProductCount'] ?? 0).toString()),
//       // );
//       // ✅ safely handle null ProductCount
//       productCount: data['ProductCount'] != null
//           ? int.tryParse(data['ProductCount'].toString()) ?? 0
//           : 0,
//     );
//     }
//     return BrandModel.empty();
//   }
// }




import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productCount,
  });

  static BrandModel empty() => BrandModel(id: '', name: '', image: '');

  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'IsFeatured': isFeatured,
      'ProductCount': productCount,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      isFeatured: data['IsFeatured'] == true,
      productCount: data['ProductCount'] != null
          ? int.tryParse(data['ProductCount'].toString()) ?? 0
          : 0,
    );
  }

  factory BrandModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return BrandModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] == true,
        productCount: data['ProductCount'] != null
            ? int.tryParse(data['ProductCount'].toString()) ?? 0
            : 0,
      );
    }
    return BrandModel.empty();
  }
}