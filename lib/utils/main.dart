// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:naturally/app.dart';
// import 'package:naturally/data/repositories/authentication/authentication_repository.dart';
// import 'package:naturally/firebase_options.dart';

// Future<void> main() async {
//     // Widgets Binding
//     final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

//     // GetX Local Storage
//     await GetStorage.init();
//     // Await Native Splash until other items Load
//     FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

//     // --Initialize Firebase & Authentication Repositories
//     await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
//       (FirebaseApp value) => Get.put(AuthenticationRepository()),
//     );

//     runApp(const App());
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:naturally/app.dart';
import 'package:naturally/bindings/general_bindings.dart';
import 'package:naturally/data/repositories/authentication/authentication_repository.dart';
import 'package:naturally/firebase_options.dart';
import 'package:naturally/utils/local_storage/storage_utility.dart';

void main() async {
  // Ensure Flutter binding is initialized
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetStorage
 //  await GetStorage.init();

  await TLocalStorage.init('myAppStorage');

  // Preserve Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize Authentication Repository
  Get.put(AuthenticationRepository());

  // Run the app
 // runApp(const App());
 runApp(
    GetMaterialApp(
      initialBinding: GeneralBindings(), // Setting up initial bindings
      home: const App(),
    ),
  );
}




// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       themeMode: ThemeMode.system,
//       theme: TAppTheme.lightTheme,
//       darkTheme: TAppTheme.darkTheme, 
//       home:  const OnBoardingScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

