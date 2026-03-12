// import 'package:ecommerseproject/features/authentication/screens/password_configuration/reset_password.dart';
// import 'package:ecommerseproject/utils/constants/sizes.dart';
// import 'package:ecommerseproject/utils/constants/text_strings.dart';
// import 'package:ecommerseproject/utils/validators/validation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// class ForgetPassword extends StatelessWidget {
//   const ForgetPassword({super.key});

//   @override
//   Widget build(BuildContext context) {
//       // FIX: added a controller and formKey so the email is actually captured
//     final emailController = TextEditingController();
//     final formKey = GlobalKey<FormState>();
//     return Scaffold(
//       appBar: AppBar(),
//       body:  Padding(
//         padding: const EdgeInsets.all(TSizes.defaultSpace),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// Headings
//             Text(
//               TTexts.forgetPasswordTitle,
//               style: Theme.of(context).textTheme.headlineMedium,
//               textAlign: TextAlign.center,
//             ),
//              SizedBox(
//               height: TSizes.spaceBtwItems,
//             ),
//             Text(
//               TTexts.forgetPasswordSubTitle,
//               style: Theme.of(context).textTheme.labelMedium,
//               textAlign: TextAlign.center,
//             ),
//              SizedBox(
//               height: TSizes.spaceBtwSections,
//             ),

//             /// Text Field
//             TextFormField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                 labelText: TTexts.email,
//                  prefixIcon: Icon(Iconsax.direct_right)
//                  ),
//               // validator: (value) {
//               //   if (value == null || value.isEmpty) {
//               //     return 'Please enter your email';
//               //   }
//               //   return null;
//               // },
//                 validator: (value) => TValidator.validateEmail(value),
//             ),
//             const SizedBox(height: TSizes.spaceBtwSections,),

//             /// submit Button 
//             SizedBox(width: double.infinity, 
//             child: ElevatedButton(
//                onPressed: () {
//                     if (formKey.currentState!.validate()) {
//                       // FIX: pass email to reset password screen
//                       Get.off(() =>
//                           ResetPassword(email: emailController.text.trim()));
//                     }
//                   },
//                   child: const Text(TTexts.submit),
//                 ),
//                ),

//           ],
//         ),
//       ),
//     );
//   }
// }




import 'package:ecommerseproject/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:ecommerseproject/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/constants/text_strings.dart';
import 'package:ecommerseproject/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
      // FIX: added a controller and formKey so the email is actually captured
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              TTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
             SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              TTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
             SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// Text Field
            Form(
              key: controller.forgetPasswordFormKey,

              child: TextFormField(
                controller: controller.email,
                validator: TValidator.validateEmail,
                decoration: const InputDecoration(
                  labelText: TTexts.email,
                   prefixIcon: Icon(Iconsax.direct_right)
                   ),
                
                  // validator: (value) => TValidator.validateEmail(value),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections,),

            /// submit Button 
            SizedBox(width: double.infinity, 
            child: ElevatedButton(
              //  onPressed: () {
              //       if (formKey.currentState!.validate()) {
              //         // FIX: pass email to reset password screen
              //         Get.off(() =>
              //             ResetPassword(email: emailController.text.trim()));
              //       }
              //     },
              onPressed: ()=> controller.sendPasswordResetEmail(),
                  child: const Text(TTexts.submit),
                ),
               ),

          ],
        ),
      ),
    );
  }
}
