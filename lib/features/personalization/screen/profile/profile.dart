import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/images/t_circular_image.dart';
import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
import 'package:ecommerseproject/features/personalization/screen/profile/widgets/profile_menu.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      ///-- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TCircularImage(
                      image: TImages.man,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text('Change Profile Pitcture')),
                  ],
                ),
              ),

              /// Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Heading Profile Info
              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TProfileMenu(
                title: 'Name',
                value: 'Coding with T',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Username',
                value: 'Coding with_t',
                onPressed: () {},
              ),
              SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Personal Info
              const TSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'User ID',
                value: '45689',
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'E-mail',
                value: 'Coding with_t',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Phone Number',
                value: '+91 86574-87971',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Gender',
                value: 'Female',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Date of Birth',
                value: '23 Oct, 1994',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Close Account',
                      style: TextStyle(color: Colors.red),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
