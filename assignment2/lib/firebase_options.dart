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
    apiKey: 'AIzaSyDjwUy3dleqDTqpKmbD-NkW6bnUGBOFdCU',
    appId: '1:111029870118:web:8775cf88beccdcc96710e7',
    messagingSenderId: '111029870118',
    projectId: 'streamthoughts1',
    authDomain: 'streamthoughts1.firebaseapp.com',
    storageBucket: 'streamthoughts1.appspot.com',
    measurementId: 'G-Z6BLRNEGM5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDfv9EnVKBYzn3AXzgsByxAhw9hT8RtrRI',
    appId: '1:111029870118:android:5844e034d418daba6710e7',
    messagingSenderId: '111029870118',
    projectId: 'streamthoughts1',
    storageBucket: 'streamthoughts1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBsT2FkSTZzjqDq0ZgwnW7ltiwEbEe8ayE',
    appId: '1:111029870118:ios:9c647650c737499a6710e7',
    messagingSenderId: '111029870118',
    projectId: 'streamthoughts1',
    storageBucket: 'streamthoughts1.appspot.com',
    iosClientId: '111029870118-fo4nb32ksr1bitfc43nrf9pfkghm6o37.apps.googleusercontent.com',
    iosBundleId: 'com.example.assignment2',
  );
}
