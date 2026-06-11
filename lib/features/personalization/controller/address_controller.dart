
import 'package:ecommerseproject/common/widgets/loaders/circular_loader.dart';
import 'package:ecommerseproject/common/widgets/texts/section_heading.dart';
import 'package:ecommerseproject/data/repositories/address/address_repository.dart';
import 'package:ecommerseproject/features/personalization/model/address_model.dart';
import 'package:ecommerseproject/features/personalization/screen/address/widgets/single_address.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/helpers/cloud_helper_function.dart';
import 'package:ecommerseproject/utils/helpers/network_manager.dart';
import 'package:ecommerseproject/utils/popups/full_screen_loader.dart';
import 'package:ecommerseproject/utils/popups/loader.dart';
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

  // Fetch all user specific addresses
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
      // Clear the 'selected' field on the previously selected address
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }
      // Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;
      // Set selected field to true for the newly selected address
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Error in selection', message: e.toString());
    }
  }

  // Add new address
  Future addNewAddresses() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog(
          'Storing Address... ', TImages.deliveredEmailIllustration);
      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Form validation
      if (!addressFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Save address data
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
      // Update selected address status
      address.id = id;
      await selectAddress(address);
      // Remove loader
      TFullScreenLoader.stopLoading();
      // Show success message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your address has been saved successfully.');
      // Refresh address data
      refreshData.toggle();
      // Reset fields
      resetFormFields();
      // Redirect back
      Navigator.of(Get.context!).pop();
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Address not found!', message: e.toString());
    }
  }

  Future<dynamic> selectNewAddressPopUp(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => Container(
              padding: EdgeInsets.all(TSizes.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TSectionHeading(title: 'Select Address'),
                  FutureBuilder(
                      future: getAllUserAddress(),
                      builder: (_, snapshot) {
                        // Helper function: handle loader, no record or error message
                        final responce =
                            TCloudHelperFunction.checkMultipleRecordsState(
                                snapshot: snapshot);
                        if (responce != null) return responce;

                        // FIX 3: Added itemCount and shrinkWrap to prevent unbounded height crash
                        // FIX 4: Changed selectedAddress(...) to selectAddress(...) — Rx object is not callable
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => TSingleAddress(
                            address: snapshot.data![index],
                            onTap: () async {
                              await selectAddress(snapshot.data![index]);
                              Get.back();
                            },
                          ),
                        );
                      }),
                ],
              ),
            ));
  }

  // Function to reset form fields
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