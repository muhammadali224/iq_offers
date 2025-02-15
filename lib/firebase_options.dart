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
    apiKey: 'AIzaSyDBtvFVTyKylMT5q3LUn3QBaXNkz4_otyg',
    appId: '1:718097374165:web:14ffad34f589e19df0fb5c',
    messagingSenderId: '718097374165',
    projectId: 'iq-offers',
    authDomain: 'iq-offers.firebaseapp.com',
    storageBucket: 'iq-offers.appspot.com',
    measurementId: 'G-8N99CY0XPL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAC1LWZ1ONzz5rcGmRIFbbyP2JGWqUN78k',
    appId: '1:718097374165:android:1f5dc5bdb7406aecf0fb5c',
    messagingSenderId: '718097374165',
    projectId: 'iq-offers',
    storageBucket: 'iq-offers.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADks8UjDVwlFdh4rQkGLndCUuEWIyzU_Q',
    appId: '1:718097374165:ios:925c56a8cc754451f0fb5c',
    messagingSenderId: '718097374165',
    projectId: 'iq-offers',
    storageBucket: 'iq-offers.appspot.com',
    iosBundleId: 'com.iqlimits.iqOffers',
  );
}
