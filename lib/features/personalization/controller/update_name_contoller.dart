
import 'package:ecommerseproject/data/user/user_repository.dart';
import 'package:ecommerseproject/features/personalization/controller/user_controller.dart';
import 'package:ecommerseproject/features/personalization/screen/profile/profile.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/helpers/network_manager.dart';
import 'package:ecommerseproject/utils/popups/full_screen_loader.dart';
import 'package:ecommerseproject/utils/popups/loader.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class UpdateNameController extends GetxController {
    static UpdateNameController get instance => Get.find();

    final firstName =  TextEditingController();
    final lastName = TextEditingController();
    final userController = UserController.instance;
    final userRepository = Get.put(UserRepository());
    GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

    @override
    void onInit() {
      initializeName();
      super.onInit();
      // Initialize the text fields with current user data
      
    }

    ///Fet user Record
    Future<void> initializeName() async{
      firstName.text = userController.user.value.firstName;
      lastName.text = userController.user.value.lastName;
    }

    Future<void> updateUserName() async {
      try{
        TFullScreenLoader.openLoadingDialog('We are updating your information.', TImages.staticSuccessIllustration);

        //check Internet Connection
        final isConnected = await NetworkManager.instance.isConnected();
        if (!isConnected) {
          TFullScreenLoader.stopLoading();
          return;
        }

        //Form validation
        if(!updateUserNameFormKey.currentState!.validate()){
          TFullScreenLoader.stopLoading();
          return;
        }

        //Update user's first and last name in Firestore
        Map<String, dynamic> name = {'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()};
        await userRepository.updateSingleField(name);

        //Update the RX user value
        userController.user.value.firstName = firstName.text.trim();
        userController.user.value.lastName = lastName.text.trim();

        //Remove Loader
        TFullScreenLoader.stopLoading();

        //Show Success
        TLoaders.successSnackBar(title: 'Congratulations', message: 'Your name has been updated successfully.');
        //Move to provious screen
        Get.off(()=> const ProfileScreen());
      
      }
      catch(e){
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
      }
      
    }

}