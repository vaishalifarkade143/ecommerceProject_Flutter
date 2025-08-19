import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate(DateTime? date){
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date); //Customize the date format as needed
  }
  static String formatCurrency(double amount) {
    return NumberFormat.currency(symbol: '\$', decimalDigits: 2, locale: 'en_US').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber){
    // Assuming phoneNumber is in the format "1234567890"
    if (phoneNumber.length == 10) {
    return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11 ) {
      // For US numbers with country code
      return '+1 (${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }
    //
    return phoneNumber;
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    String countryCode = '(${digitsOnly.substring(0, 2)})'; // Assuming first two digits are country code
    digitsOnly = digitsOnly.substring(2);

    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode)');

    int i = 0 ;
    while(i < digitsOnly.length) {
      int groupLength = 2;
      if (i == 0 && countryCode.length == '+1') {
        groupLength = 3; // First group is 3 digits for US numbers
      } 
      int end = i + groupLength;
      formattedNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formattedNumber.write(' '); // Add space between groups
      }
      i = end;
    }

    return phoneNumber;
  }

}