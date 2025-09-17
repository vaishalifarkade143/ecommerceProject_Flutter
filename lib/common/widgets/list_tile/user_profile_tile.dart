import 'package:ecommerseproject/common/widgets/images/t_circular_image.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(
        image: TImages.man, width: 50, height: 50, padding: 0, ),
        title: Text('Coding with V' , style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
        subtitle: Text('vaishali.f@veerit.com' , style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
        trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: TColors.white,)),

    );
  }
}