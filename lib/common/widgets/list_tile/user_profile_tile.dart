



// import 'package:ecommerseproject/common/widgets/images/t_circular_image.dart';
// import 'package:ecommerseproject/features/personalization/controller/user_controller.dart';
// import 'package:ecommerseproject/utils/constants/colors.dart';
// import 'package:ecommerseproject/utils/constants/image_strings.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// class TUserProfileTile extends StatelessWidget {
//   const TUserProfileTile({
//     super.key,
//     required this.onPressed,
//   });
//   final VoidCallback onPressed;

//   @override
//   Widget build(BuildContext context) {
//     // Get the UserController — it's already registered in GeneralBindings
//     final controller = Get.put(UserController());

//     return Obx(() {
//       // Show a loading shimmer while fetching
//       if (controller.isLoading.value) {
//         return const ListTile(
//           leading: CircularProgressIndicator(color: TColors.white),
//           title: Text('Loading...', style: TextStyle(color: TColors.white)),
//         );
//       }

//       final user = controller.user.value;

//       return ListTile(
//         leading: TCircularImage(
//           // Show profile picture if available, otherwise fallback to default
//           image: user.profilePicture.isNotEmpty
//               ? user.profilePicture
//               : TImages.man,
//           width: 50,
//           height: 50,
//           padding: 0,
//           isNetworkImage: user.profilePicture.isNotEmpty,
//         ),
//         // Show real full name from Firestore
//         title: Text(
//           user.fullName.isNotEmpty ? user.fullName : 'User',
//           style: Theme.of(context)
//               .textTheme
//               .bodyLarge!
//               .apply(color: TColors.white),
//         ),
//         // Show real email from Firestore
//         subtitle: Text(
//           user.email.isNotEmpty ? user.email : '',
//           style: Theme.of(context)
//               .textTheme
//               .bodyMedium!
//               .apply(color: TColors.white),
//         ),
//         trailing: IconButton(
//           onPressed: onPressed,
//           icon: const Icon(Iconsax.edit, color: TColors.white),
//         ),
//       );
//     });
//   }
// }









import 'package:ecommerseproject/common/widgets/images/t_circular_image.dart';
import 'package:ecommerseproject/features/personalization/controller/user_controller.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // Get the UserController — it's already registered in GeneralBindings
    final controller = UserController.instance;

      final user = controller.user.value;

      return ListTile(
        leading: TCircularImage(
          // Show profile picture if available, otherwise fallback to default
          image: user.profilePicture.isNotEmpty
              ? user.profilePicture
              : TImages.man,
          width: 50,
          height: 50,
          padding: 0,
          isNetworkImage: user.profilePicture.isNotEmpty,
        ),
        // Show real full name from Firestore
        title: Text(
          controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .apply(color: TColors.white),
        ),
        // Show real email from Firestore
        subtitle: Text(
           controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.white),
        ),
        trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(Iconsax.edit, color: TColors.white),
        ),
      );
   
  }
}