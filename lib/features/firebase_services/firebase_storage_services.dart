
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TFirebaseStorageService extends GetxController {
  static TFirebaseStorageService get instance => Get.find();
  /// Initialize Firebase Storage instance
  final _firebaseStorage = FirebaseStorage.instance;

  /// Upload image data to Firebase Storage and return the download URL
  Future<Uint16List> getImageDateFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint16List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw "Failed to load image from assets: $e";
    
    } 
  }

  /// Get image data from local assets as a list of bytes
  Future<String> uploadImageData(String path, Uint16List image, String name) async {
    try {
     final ref = _firebaseStorage.ref(path).child(name);
     await ref.putData(image as Uint8List);
     final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if(e is FirebaseException) {
        throw "Firebase Exception: ${e.code} - ${e.message}";
      }else if(e is SocketException) {
        throw "Network error: ${e.message}";
      }
      else if(e is PlatformException) {
        throw "Platform error: ${e.message}";
      }else{
        throw "Failed to upload image: $e";
      }
     
    }
  }

  ///Upload image on cloud storage and return the download URL
  /// Return the download URL of the uploaded image
  Future<String> uploadImageFile(String path, XFile image) async
  {
    try{
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    }
    catch(e){
      if(e is FirebaseException) {
        throw "Firebase Exception: ${e.code} - ${e.message}";
      }else if(e is SocketException) {
        throw "Network error: ${e.message}";
      }
      else if(e is PlatformException) {
        throw "Platform error: ${e.message}";
      }else{
        throw "Failed to upload image: $e";
      }
    }

  }

}