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
    apiKey: 'AIzaSyC4gA8WMma0qYTps0r3Bu-1FnlMtwcuytM',
    appId: '1:570903470799:web:08d720e517a63f20b28dba',
    messagingSenderId: '570903470799',
    projectId: 'delete-cd28a',
    authDomain: 'delete-cd28a.firebaseapp.com',
    storageBucket: 'delete-cd28a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBeD6yN-xpG6ZxVMgwKeFa0MqKkwMUlaCE',
    appId: '1:570903470799:android:e9b3e007acc01d3fb28dba',
    messagingSenderId: '570903470799',
    projectId: 'delete-cd28a',
    storageBucket: 'delete-cd28a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxl48bY5p6U5KE1qLnNsSLoNoZo_rTV-M',
    appId: '1:570903470799:ios:c721136bdfc91bbeb28dba',
    messagingSenderId: '570903470799',
    projectId: 'delete-cd28a',
    storageBucket: 'delete-cd28a.appspot.com',
    iosClientId: '570903470799-ojcfl2dgenalslp0db3mqptlp9d8k8sb.apps.googleusercontent.com',
    iosBundleId: 'com.example.harvestx',
  );
}
