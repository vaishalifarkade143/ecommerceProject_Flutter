import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseproject/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerseproject/features/personalization/model/address_model.dart';
import 'package:get/get.dart';

class AddressRepository extends GetxController{
  
  static AddressRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddresses() async {
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty) {
        throw 'Unable to find user information .Try again in few minutes.';
      }
      final result = await _db.collection('Users').doc(userId).collection('Addresses').get();
      return result.docs.map((documentSnapshot) => AddressModel.fromDocumentSnapShot(documentSnapshot)).toList();

    }
    catch (e){
      throw 'Something went wrong while fetching address Information.Try again later';
    }
    
  }

  //Clear the selected field for all addresses
  Future<void> updateSelectedField(String addressId, bool selected) async{
    try{
      final userId =  AuthenticationRepository.instance.authUser!.uid;
      await _db.collection('Users').doc(userId).collection('Addresses').doc(addressId).update({'SelectedAddress': selected});
    }
    catch(e) {
      throw 'Unable to update your address selection. try again later';

    }
  }

  Future<String> addAddress(AddressModel address) async {
    try{
        final userId = AuthenticationRepository.instance.authUser!.uid;
        final currentAddress =  await _db.collection('Users').doc(userId).collection('Addresses').add(address.toJson());
        return currentAddress.id;
    }
    catch(e){
      throw 'Something went wrong while saving address Information.try again later.';

    }
  }
}