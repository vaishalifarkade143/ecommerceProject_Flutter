class TFormatExceptions implements Exception {
  final String message;

  ///Constructor that take on error code
  TFormatExceptions([this.message = 'An unexpected error occurred. Please try again later.']);

  ///create a format exception from a code
   factory TFormatExceptions.fromMessage(String message) {
     // You can customize the mapping of error codes to messages here
    return TFormatExceptions(message);
  }

  ///Get the corresponding message 
  String get formattedMessage => message;
  

///Create a format exception from a specific error code
  factory TFormatExceptions.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return TFormatExceptions("The email address is not valid. Please enter a valid email.") ;
      case 'invalid-phone-number-format':
        return TFormatExceptions("The phone number format is not valid. Please enter a valid phone number.");
      case 'invalid-date-format':
        return TFormatExceptions("The date format is not valid. Please enter a valid date.");
      case 'invalid-url-format':
        return TFormatExceptions("The URL format is not valid. Please enter a valid URL.");
          case 'invalid-credit-card-format':
        return TFormatExceptions("The credit card format is not valid. Please enter a valid credit card number.");
          case 'invalid-numeric-format':
        return TFormatExceptions("The numeric format is not valid. Please enter a valid number.");
          //add more cases as needed
      default:
        return TFormatExceptions("An unknown error occurred. Please try again later.");
    }
  }
}