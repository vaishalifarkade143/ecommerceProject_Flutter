import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:ecommerseproject/common/widgets/list_tile/user_profile_tile.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// -- Header
          PrimaryHeaderContainer(
            height: 200,
            child: Column(
              children: [
                ///  AppBar
               TAppBar(title: Text('Account' , style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),),),
              // const SizedBox(height: TSizes.spaceBtwSections,), 

              ///  UserProfile Card
              TUserProfileTile(),
              

              ],
            ) )
          ],
        ),
      ),
    );
  }
}

