class TFirebaseExceptions implements Exception {
  /// The error code associated with the exception
  final String code;

  ///Constructor that take on error code
  TFirebaseExceptions(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return "An unknown error occurred. Please try again later.";
      case 'invalid-custom-token':
        return "Custom token format is incorrect. Please check the documentation.";
      case 'custom-token-mismatch':
        return "The custom token does not correspond to the current user. Please use the correct token or log in.";
      case 'user-disabled':
        return "This user has been disabled.";
      case 'user-not-found':
        return "No user found with this email. Please check and try again.";
      case 'invalid-email':
        return "The email address is not valid. Please check and try again.";
      case 'email-already-in-use':
        return "The email address is already in use. Please use a different email or log in.";
      case 'wrong-password':
        return "The password is incorrect. Please try again.";
      case 'weak-password':
        return "The password is too weak. Please choose a stronger password.";
      case 'provider-already-linked':
        return "The provider is already linked to the user. Please use a different provider or log in.";
      case 'option-not-allowed':
        return "The operation is not allowed. Please contact support for assistance.";
      case 'invalid-credential':
        return "The provided credential is invalid. Please check and try again.";
      case 'invalid-verification-code':
        return "The verification code is invalid. Please enter a valid verification code.";
      case 'invalid-verification-id':
        return "The verification ID is invalid. Please enter a valid verification ID.";
      case 'captcha-check-failed':
        return "The CAPTCHA check failed. Please try again.";
      case 'app-not-authorized':
        return "The app is not authorized to use Firebase Authentication. Please contact support for assistance.";
      case 'keychain-error':
        return "An error occurred while accessing the keychain. Please try again later.";
      case 'internal-error':
        return "An internal error occurred. Please try again later.";
      case 'invalid-app-credential':
        return "The app credential is invalid. Please check and try again.";

      case 'quota-exceeded':
        return "You have exceeded the number of verification attempts. Please try again later.";
      case 'email-already-exists':
        return "An account already exists with this email. Please use a different email or log in.";
      case 'requires-recent-login':
        return "You need to re-authenticate to perform this action. Please log in again.";
      case 'credential-already-in-use':
        return "The credential is already in use. Please use a different credential or log in.";
      case 'user-mismatch':
        return "The provided credential does not correspond to the current user. Please use the correct credential or log in.";
      case 'account-exists-with-different-credential':
        return "An account already exists with the provided credential. Please use a different credential or log in.";
      case 'expired-action-code':
        return "The action code has expired. Please request a new code and try again.";
      case 'invalid-action-code':
        return "The action code is invalid. Please request a new code and try again.";
      case 'missing-action-code':
        return "The action code is missing. Please request a new code and try again.";
      case 'user-token-expired':
        return "The user's credential is no longer valid. Please log in again.";
      case 'user-token-revoked':
        return "The user's credential has been revoked. Please log in again.";
      case 'invalid-message-payload':
        return "The message payload is invalid. Please check and try again.";
      case 'invalid-sender':
        return "The sender is invalid. Please check and try again.";
      case 'invalid-recipient-email':
        return "The recipient email is invalid. Please check and try again.";
      case 'missing-iframe-start':
        return "The iframe start is missing. Please check and try again.";
      default:
        return "An unknown firebass error occurred. Please try again later.";
    }
  }
}
