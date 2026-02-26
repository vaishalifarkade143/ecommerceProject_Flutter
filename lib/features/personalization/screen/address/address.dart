import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/common/widgets/custom_shapes/container/t_rounded_container.dart';
import 'package:ecommerseproject/features/personalization/screen/address/add_new_address.dart';
import 'package:ecommerseproject/features/personalization/screen/address/widgets/single_address.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(() => const AddNewAddress()),
          child: Icon(Iconsax.add ,color: TColors.white,),
          backgroundColor: TColors.primary,
         ),
          appBar: TAppBar(
            title: Text('Address', style: Theme.of(context).textTheme.headlineSmall,),
            showBackArrow: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
              TSingleAddress(selecedAddress: false),
              TSingleAddress(selecedAddress: true),
              ],
            ),
          )
    );
  }
}
