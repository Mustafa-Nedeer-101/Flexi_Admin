// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyB-hwHbPUYhMwUn44UCX1euEH0hgJ2STcQ',
    appId: '1:1069814630936:web:93cde3347b16529077516d',
    messagingSenderId: '1069814630936',
    projectId: 'flexi-b37db',
    authDomain: 'flexi-b37db.firebaseapp.com',
    storageBucket: 'flexi-b37db.appspot.com',
    measurementId: 'G-3BL9NQDZZ5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAkE3glwM202-6r0dcUCLvWk_DY_2tPvs',
    appId: '1:1069814630936:android:f162bc3091960dec77516d',
    messagingSenderId: '1069814630936',
    projectId: 'flexi-b37db',
    storageBucket: 'flexi-b37db.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD59ZzeVz4xqihQEncqb5K6Vf9PpGVGmfM',
    appId: '1:1069814630936:ios:b8790ac40b70b49577516d',
    messagingSenderId: '1069814630936',
    projectId: 'flexi-b37db',
    storageBucket: 'flexi-b37db.appspot.com',
    androidClientId: '1069814630936-3tad1nbfogj50qsfvj78rd19223q7mku.apps.googleusercontent.com',
    iosClientId: '1069814630936-cghf90b21avkgaj7l009p29isrs4is9d.apps.googleusercontent.com',
    iosBundleId: 'com.example.admin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD59ZzeVz4xqihQEncqb5K6Vf9PpGVGmfM',
    appId: '1:1069814630936:ios:b8790ac40b70b49577516d',
    messagingSenderId: '1069814630936',
    projectId: 'flexi-b37db',
    storageBucket: 'flexi-b37db.appspot.com',
    androidClientId: '1069814630936-3tad1nbfogj50qsfvj78rd19223q7mku.apps.googleusercontent.com',
    iosClientId: '1069814630936-cghf90b21avkgaj7l009p29isrs4is9d.apps.googleusercontent.com',
    iosBundleId: 'com.example.admin',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDTl-ACSGAeDhFb8CayPB5zSPwaz0juj_M',
    appId: '1:1069814630936:web:c6d2d4d0c7b8f73577516d',
    messagingSenderId: '1069814630936',
    projectId: 'flexi-b37db',
    authDomain: 'flexi-b37db.firebaseapp.com',
    storageBucket: 'flexi-b37db.appspot.com',
    measurementId: 'G-S71VEPF2P5',
  );

}