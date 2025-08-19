import 'package:logger/logger.dart';

class TLoggerHelper {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    level: Level.debug,
  );
  // Log messages with different severity levels
  // This class provides methods to log messages at various levels such as debug, info, warning, and error.
  static void debug(String message) {
    _logger.d(message);
  }

  // Log an error message
  // This method logs an error message with the error level.
  static void info(String message) {
    _logger.i(message);
  }

  // Log a warning message
  // This method logs a warning message with the warning level.
  static void warning(String message) {
    _logger.w(message);
  }

  // Log an error message
  // This method logs an error message with the error level.
  static void error(String message, [dynamic error]){
    _logger.e(message,error: error, stackTrace: StackTrace.current);
    
  }
}
