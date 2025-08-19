import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  static final TLocalStorage _instance = TLocalStorage._internal();

  factory TLocalStorage() {
    return _instance;
  }
  TLocalStorage._internal();
  final _storage = GetStorage();

  //generic method to save data
  // This method saves data of type T to local storage using the provided key.
  // It uses the GetStorage package for persistent storage.
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Method to read data from local storage
  // This method retrieves data of type T from local storage using the provided key.
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // Method to check if a key exists in local storage
  // This method checks if a specific key exists in the local storage.
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  //clear all data from local storage
  Future<void> clearAll() async{
    await _storage.erase();
  }
}
