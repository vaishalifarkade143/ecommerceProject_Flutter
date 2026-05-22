// import 'package:cloud_firestore/cloud_firestore.dart';

// class BannerModel{
//   String imageUrl;
//   final String targetScreen;
//   final bool active;
//   BannerModel({
//     required this.imageUrl,
//     required this.targetScreen,
//     required this.active,
//   });

//   Map<String,dynamic> toJson(){
//     return {
//       'ImageUrl' : imageUrl,
//       'TargetScreen' : targetScreen,
//       'Active' : active,
//     };
//   }
//   factory BannerModel.fromSnapshot(DocumentSnapshot snapshot){
//     final data = snapshot.data() as Map<String,dynamic>;
//     return BannerModel(
//       imageUrl: data['ImageUrl'] ?? '',
//      targetScreen: data['TargetScreen'] ?? '',
//       active: data['Active'] ?? false
//       );
//   }
// }





// import 'package:cloud_firestore/cloud_firestore.dart';

// class BannerModel {
//   String imageUrl;
//   final String targetScreen;
//   final bool active;
//   final bool isLocalAsset; // NEW

//   BannerModel({
//     required this.imageUrl,
//     required this.targetScreen,
//     required this.active,
//     this.isLocalAsset = false, // NEW
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'imageUrl': imageUrl,
//       'targetScreen': targetScreen,
//       'active': active,
//     };
//   }

//   factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
//     final data = snapshot.data() as Map<String, dynamic>;
//     return BannerModel(
//       imageUrl: data['imageUrl'] ?? '',
//       targetScreen: data['targetScreen'] ?? '',
//       active: data['active'] ?? false,
//     );
//   }
// }




import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'targetScreen': targetScreen,
      'active': active,
    };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    // ✅ Handles BOTH old capitalized AND new lowercase field names
    // Works whether Firestore has 'ImageUrl' or 'imageUrl'
    final imageUrl = data['imageUrl'] ?? data['ImageUrl'] ?? '';
    final targetScreen = data['targetScreen'] ?? data['TargetScreen'] ?? '/home';
    final active = data['active'] ?? data['Active'] ?? false;

    print('🖼️ Parsed → imageUrl: $imageUrl | targetScreen: $targetScreen | active: $active');

    return BannerModel(
      imageUrl: imageUrl,
      targetScreen: targetScreen,
      active: active,
    );
  }
}