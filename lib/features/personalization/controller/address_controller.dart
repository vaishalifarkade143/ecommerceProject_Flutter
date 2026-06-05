import 'package:ecommerseproject/common/widgets/loaders/circular_loader.dart';
import 'package:ecommerseproject/data/repositories/address/address_repository.dart';
import 'package:ecommerseproject/features/personalization/model/address_model.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/helpers/network_manager.dart';
import 'package:ecommerseproject/utils/popups/full_screen_loader.dart';
import 'package:ecommerseproject/utils/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  //Future all user specific address
  Future<List<AddressModel>> getAllUserAddress() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: TCircularLoader(),
      );
      //clear the 'selected' field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }
      //assign     selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;
      //Assign selected field to true the newly selected address
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);

          Get.back();
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Error in selection', message: e.toString());
    }
  }

  //Add new address
  Future addNewAddresses() async {
    try {
      //start Loading
      TFullScreenLoader.openLoadingDialog(
          'Storing Address... ', TImages.deliveredEmailIllustration);
      //check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //form validation
      if (!addressFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //save address Data
      final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          postalCode: postalCode.text.trim(),
          country: country.text.trim(),
          selectedAddress: true);

      final id = await addressRepository.addAddress(address);
      //update Selected address Status
      address.id = id;
      await selectAddress(address);
      //Remove Loader
      TFullScreenLoader.stopLoading();
      //show success Message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your address has been saved successfully.');
      //Refresh address  data
      refreshData.toggle();
      //Reset Fields
      resetFormFields();
      //Rediect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Address not found!', message: e.toString());
    }
  }

//Function to reset form field
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
