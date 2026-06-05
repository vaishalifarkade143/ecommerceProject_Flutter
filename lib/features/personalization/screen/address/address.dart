import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/features/personalization/controller/address_controller.dart';
import 'package:ecommerseproject/features/personalization/screen/address/add_new_address.dart';
import 'package:ecommerseproject/features/personalization/screen/address/widgets/single_address.dart';
import 'package:ecommerseproject/utils/constants/colors.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(() => const AddNewAddress()),
          child: Icon(
            Iconsax.add,
            color: TColors.white,
          ),
          backgroundColor: TColors.primary,
        ),
        appBar: TAppBar(
          title: Text(
            'Address',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child:
                // TSingleAddress(selecedAddress: false),
                Obx(
              () => FutureBuilder(
                  //Use key to trigger refresh
                  key: Key(controller.refreshData.value.toString()),
                  future: controller.getAllUserAddress(),
                  builder: (context, snapshot) {
                    //Helper function:handle Loader
                    final responce =
                        TCloudHelperFunction.checkMultipleRecordsState(
                            snapshot: snapshot);
                    if (responce != null) return responce;

                    final addresses = snapshot.data!;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: addresses.length,
                        itemBuilder: (_, index) => TSingleAddress(
                              address: addresses[index],
                              onTap: () =>
                                  controller.selectAddress(addresses[index]),
                            ));
                  }),
            ),
          ),
        ));
  }
}
