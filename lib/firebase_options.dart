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
    apiKey: 'AIzaSyBbmqaqodTZyK0P3u4aJCIBFLwRGQzVXPk',
    appId: '1:648089609317:web:05ddbe51a6e914d240928c',
    messagingSenderId: '648089609317',
    projectId: 'apps-83778',
    authDomain: 'apps-83778.firebaseapp.com',
    storageBucket: 'apps-83778.appspot.com',
    measurementId: 'G-YGZR362SNH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAj8QZ-w5k-zn62huOpVk9aIIFDspofnqY',
    appId: '1:648089609317:android:6cdd5da240a0031d40928c',
    messagingSenderId: '648089609317',
    projectId: 'apps-83778',
    storageBucket: 'apps-83778.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTg8v9qS73bqOP50hEKhQ_OVOyQYJDO-Q',
    appId: '1:648089609317:ios:6cbc197785da25aa40928c',
    messagingSenderId: '648089609317',
    projectId: 'apps-83778',
    storageBucket: 'apps-83778.appspot.com',
    iosBundleId: 'com.example.apps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTg8v9qS73bqOP50hEKhQ_OVOyQYJDO-Q',
    appId: '1:648089609317:ios:6cbc197785da25aa40928c',
    messagingSenderId: '648089609317',
    projectId: 'apps-83778',
    storageBucket: 'apps-83778.appspot.com',
    iosBundleId: 'com.example.apps',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBbmqaqodTZyK0P3u4aJCIBFLwRGQzVXPk',
    appId: '1:648089609317:web:5191370bc06ba43d40928c',
    messagingSenderId: '648089609317',
    projectId: 'apps-83778',
    authDomain: 'apps-83778.firebaseapp.com',
    storageBucket: 'apps-83778.appspot.com',
    measurementId: 'G-R865TMJEHZ',
  );

}