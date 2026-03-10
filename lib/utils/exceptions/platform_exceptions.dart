class TPlatformExceptions implements Exception {
  final String code;

  TPlatformExceptions(this.code);

  String get message{
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return "Invalid login credentials. Please try again.";
      case 'to-many-requests':
        return "Too many requests. Please try again later.";
      case 'invalid-arguments':
        return "Invalid arguments. Please try again later.";
      case 'invalid-password':
        return "Invalid password. Please try again.";
      case 'invalid-phone-number':
        return "Invalid phone number. Please try again.";
        case 'operation-not-allowed':
        return "This operation is not allowed. Please contact support.";
        case 'session-cookie-expired':
        return "Firebase session expired. Please login again.";
        case 'uid-already-exists':
        return "A provider user with this UID already exists. Please try again.";
        case 'sign-in-failed':
        return "Sign-in-failed. Please try again.";
        case 'network-request-failed':
        return "Network request failed. Please check your internet connection.";
        case 'internal-error':
        return "An internal error occurred. Please try again.";
        case 'invalid-verification-code':
        return "Invalid verification code. Please try again.";
        case 'invalid-verification-id':
        return "Invalid verification ID. Please try again.";
      default:
        return "An unexpected error occurred. Please try again.";
    }
  }
}