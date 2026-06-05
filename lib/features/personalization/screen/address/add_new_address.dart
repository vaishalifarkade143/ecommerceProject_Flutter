import 'package:ecommerseproject/common/widgets/appbar/appbar.dart';
import 'package:ecommerseproject/features/personalization/controller/address_controller.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Add New Address'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
            key: controller.addressFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) =>
                      TValidator.validateEmptyText('Name', value),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                ),
                SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) => TValidator.validatePhoneNumber(value),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: 'Phone Number'),
                ),
                SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: controller.street,
                      validator: (value) =>
                          TValidator.validateEmptyText('Street', value),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: 'Street'),
                    )),
                    SizedBox(
                      width: TSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                        child: TextFormField(
                      controller: controller.postalCode,
                      validator: (value) =>
                          TValidator.validateEmptyText('Postal Code', value),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: 'Postal Code'),
                    )),
                  ],
                ),
                SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: controller.city,
                      validator: (value) =>
                          TValidator.validateEmptyText('City', value),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: 'City'),
                    )),
                    SizedBox(
                      width: TSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                        child: TextFormField(
                      controller: controller.state,
                      validator: (value) =>
                          TValidator.validateEmptyText('State', value),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: 'State'),
                    )),
                  ],
                ),
                SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  controller: controller.country,
                  validator: (value) =>
                      TValidator.validateEmptyText('Country', value),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                ),
                SizedBox(
                  height: TSizes.defaultSpace,
                ),
                SizedBox(
                  width: double.infinity,
                  child:
                    ElevatedButton(onPressed: () => controller.addNewAddresses(), child: Text('Save')
                 ),
                )
              ],
            )),
      ),
    );
  }
}
