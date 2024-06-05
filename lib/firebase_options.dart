// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDQfmusTT5wcGTQWvZzpQwCCvG2F7Y043k',
    appId: '1:1028260407363:web:8c1da5fcb0f5692914ccf6',
    messagingSenderId: '1028260407363',
    projectId: 'ecommerceapp-a707c',
    authDomain: 'ecommerceapp-a707c.firebaseapp.com',
    storageBucket: 'ecommerceapp-a707c.appspot.com',
    measurementId: 'G-6MYD8T2MMV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZ1KzZczvONttS7T3pjXut-aoaQopH8GU',
    appId: '1:1028260407363:android:e594690862887bda14ccf6',
    messagingSenderId: '1028260407363',
    projectId: 'ecommerceapp-a707c',
    storageBucket: 'ecommerceapp-a707c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiN2GwkD_NP4YvPFA9QwMzGCoh-QNeecU',
    appId: '1:1028260407363:ios:ee145f5b71f7945014ccf6',
    messagingSenderId: '1028260407363',
    projectId: 'ecommerceapp-a707c',
    storageBucket: 'ecommerceapp-a707c.appspot.com',
    androidClientId: '1028260407363-l0qo7o6hqmnj0f33hgfqknc6pqaijs61.apps.googleusercontent.com',
    iosClientId: '1028260407363-17q6hqjr4s4bvhi5v5g4j3jao8epbhr6.apps.googleusercontent.com',
    iosBundleId: 'com.example.naturally',
  );
}
