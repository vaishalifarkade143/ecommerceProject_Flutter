import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseproject/utils/formatters/formatter.dart';
import 'package:get/state_manager.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  ///Helper function to get full name
  String get fullName => '$firstName $lastName';

  /// Helper Function to format phone name
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to format phone number.
  static List<String> nameParts(fullName) => fullName.split(' ');

  /// Static  function  to generate a username from the full name
  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase(); // Start with the first name
    String lastName = nameParts.length > 1
        ? nameParts[1]
            .toLowerCase() // Add the initial of the last name if it exists
        : '';
    String camelCaseUsername =
        "$firstName$lastName"; // Combine first name and last name initial
    String usernameWithPrefix =
        "cwt_$camelCaseUsername"; // Add prefix to the username
    return usernameWithPrefix;
  }

  /// Static  function to create  an empty user model
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        userName: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
      );

  /// Convert Model to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "UserName": userName,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "ProfilePicture": profilePicture,
    };
  } 

  /// Create Model from Firestore
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return UserModel(
        id: document.id,
        firstName: data["FirstName"] ?? "",
        lastName: data["LastName"] ?? "",
        userName: data["UserName"] ?? "",
        email: data["Email"] ?? "",
        phoneNumber: data["PhoneNumber"] ?? "",
        profilePicture: data["ProfilePicture"] ?? "",
      );
    }
    return UserModel.empty();
  }
  
}
