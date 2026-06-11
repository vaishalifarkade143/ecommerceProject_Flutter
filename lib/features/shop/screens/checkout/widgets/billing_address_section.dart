// import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
// import 'package:ecommerseproject/features/personalization/controller/address_controller.dart';
// import 'package:ecommerseproject/utils/constants/sizes.dart';
// import 'package:flutter/material.dart';

// class TBillingAddressSection extends StatelessWidget {
//   const TBillingAddressSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final addressController = AddressController.instance;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TSectionHeading(
//             title: 'Shipping Address',
//             buttonTitle: 'change',
//             onPressed: () => addressController.selectNewAddressPopUp(context)),
//         addressController.selectedAddress.value.id.isNotEmpty
//             ? Column(
//                 children: [
//                   Text(address.name,
//                       style: Theme.of(context).textTheme.bodyMedium),
//                   SizedBox(
//                     height: TSizes.spaceBtwItems / 2,
//                   ),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.phone,
//                         size: 16,
//                         color: Colors.grey,
//                       ),
//                       SizedBox(
//                         width: TSizes.spaceBtwItems,
//                       ),
//                       Text('+1 234 567 890',
//                           style: Theme.of(context).textTheme.bodyMedium),
//                     ],
//                   ),
//                   SizedBox(
//                     height: TSizes.spaceBtwItems / 2,
//                   ),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.location_history,
//                         size: 16,
//                         color: Colors.grey,
//                       ),
//                       SizedBox(
//                         width: TSizes.spaceBtwItems,
//                       ),
//                       Expanded(
//                           child: Text(
//                         '123 Main Street, City, Country ',
//                         style: Theme.of(context).textTheme.bodyMedium,
//                         softWrap: true,
//                       )),
//                     ],
//                   ),
//                   SizedBox(
//                     height: TSizes.spaceBtwItems / 2,
//                   ),
//                 ],
//               )
//             : Text('Selected Address',
//                 style: Theme.of(context).textTheme.bodyMedium),
//       ],
//     );
//   }
// }





import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
import 'package:ecommerseproject/features/personalization/controller/address_controller.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
            title: 'Shipping Address',
            buttonTitle: 'change',
            onPressed: () => addressController.selectNewAddressPopUp(context)),

        // FIX 1: Wrapped with Obx so UI reacts to address changes
        // FIX 2: Using real address data instead of hardcoded placeholder strings
        Obx(() {
          final address = addressController.selectedAddress.value;
          return address.id.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: TSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        const Icon(Icons.phone, size: 16, color: Colors.grey),
                        SizedBox(width: TSizes.spaceBtwItems),
                        Text(
                          address.formattedPhoneNo,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: TSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        const Icon(Icons.location_history,
                            size: 16, color: Colors.grey),
                        SizedBox(width: TSizes.spaceBtwItems),
                        Expanded(
                          child: Text(
                            address.toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: TSizes.spaceBtwItems / 2),
                  ],
                )
              : Text(
                  'No address selected',
                  style: Theme.of(context).textTheme.bodyMedium,
                );
        }),
      ],
    );
  }
}