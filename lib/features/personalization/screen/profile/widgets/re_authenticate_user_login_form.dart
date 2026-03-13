
import 'package:ecommerseproject/features/personalization/controller/user_controller.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/constants/text_strings.dart';
import 'package:ecommerseproject/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return  Scaffold(
      appBar: AppBar(
        // showBackArrow: true,
        title: Text('Re-Authenticate User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFromKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  decoration: const InputDecoration(
                     prefixIcon: Icon(Iconsax.direct_right),
                    labelText:TTexts.email),
                  validator: TValidator.validateEmail,
                ),
                SizedBox(height: TSizes.spaceBtwInputFields,),
                Obx (
                  ()=>  TextFormField(
                    controller: controller.verifyPassword,
                     obscureText: controller.hidePassword.value,
                    validator: (value) => TValidator.validateEmptyText("Password", value),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.lock),
                      labelText: TTexts.password,
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                        icon:  Icon(Iconsax.eye_slash) ),
                      ),
                      ),
                  ),
                
        
                const SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                    child: const Text('Re-Authenticate'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}