import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TCloudHelperFunction {
  // This class can be used to define any helper functions related to cloud operations, such as fetching data from Firestore, handling queries, etc.
  //Helper function to check the state of a single database record
  /// Checks the state of a single record in a FutureBuilder snapshot and returns an appropriate widget based on the state.
  /// Returns a loading indicator if the data is still being fetched, an error message if there was an error, or a "No data found" message if the data is null or empty. If the data is available, it returns null, indicating that the caller can proceed to display the data.
  /// Example usage:
  static Widget? checkSingleRecordState<T>(
    AsyncSnapshot<T> snapshot,
  ) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: const CircularProgressIndicator());
    }
    if (!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text('No data Found!'));
    }
    if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    }

    return null; // Data is available, no need to show any message
  }

  //Helper function to check the state of multiple database records
  /// Checks the state of multiple records in a FutureBuilder snapshot and returns an appropriate widget based on the state.
  /// Returns a loading indicator if the data is still being fetched, an error message if there
  /// was an error, or a "No data found" message if the data is null or empty. If the data is available, it returns null, indicating that the caller can proceed to display the data.
  /// Example usage:
  static Widget? checkMultipleRecordsState<T>( {required AsyncSnapshot<List<T>> snapshot,
      Widget? loader, Widget? error, Widget? nothingFound}) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      if (loader != null) return loader;
      return const Center(child: CircularProgressIndicator());
    }
    if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      if (nothingFound != null) return nothingFound;
      return const Center(child: Text('No data Found!'));
    }
    if (snapshot.hasError) {
      if (error != null) return error;
      return Center(child: Text('Error: ${snapshot.error}'));
    }
    return null;
  }

  //Create a reference with on initial file path and name to be used for uploading files to cloud storage
  static Future<String> getUrlFromFilePathAndName(String path) async {
    try {
      if (path.isEmpty) return '';
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw 'Firebase error: ${e.message}';
    } on PlatformException catch (e) {
      throw 'Platform error: ${e.message}';
    } catch (e) {
      throw 'Something went wrong.';
    }
  }
}
