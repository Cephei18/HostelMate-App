// File: lib/firebase_options.dart

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform, kIsWeb;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyCG388i-0gBTifw28o3CPbfLxKYt9yudvQ",
    authDomain: "hostelmate-35544.firebaseapp.com",
    projectId: "hostelmate-35544",
    storageBucket: "hostelmate-35544.firebasestorage.app",
    messagingSenderId: "375494999168",
    appId: "1:375494999168:web:a0f3ef9fd3349fdeff7a65",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyCG388i-0gBTifw28o3CPbfLxKYt9yudvQ",
    authDomain: "hostelmate-35544.firebaseapp.com",
    projectId: "hostelmate-35544",
    storageBucket: "hostelmate-35544.firebasestorage.app",
    messagingSenderId: "375494999168",
    appId: "1:375494999168:web:a0f3ef9fd3349fdeff7a65",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyCG388i-0gBTifw28o3CPbfLxKYt9yudvQ",
    authDomain: "hostelmate-35544.firebaseapp.com",
    projectId: "hostelmate-35544",
    storageBucket: "hostelmate-35544.firebasestorage.app",
    messagingSenderId: "375494999168",
    appId: "1:375494999168:web:a0f3ef9fd3349fdeff7a65",
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: "AIzaSyCG388i-0gBTifw28o3CPbfLxKYt9yudvQ",
    authDomain: "hostelmate-35544.firebaseapp.com",
    projectId: "hostelmate-35544",
    storageBucket: "hostelmate-35544.firebasestorage.app",
    messagingSenderId: "375494999168",
    appId: "1:375494999168:web:a0f3ef9fd3349fdeff7a65",
  );
}
