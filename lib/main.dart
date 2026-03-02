import 'package:ecommerseproject/app.dart';
import 'package:ecommerseproject/data/repositories/authentication_repository.dart';
import 'package:ecommerseproject/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  //widgets binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

      //Init Local Storage
  await GetStorage.init();

  //Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
// Initialize Firebase n Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  .then((FirebaseApp value) => Get.put(AuthenticationRepository()),
  );
  runApp(const App());
  // TColors.linearGradient;
}
