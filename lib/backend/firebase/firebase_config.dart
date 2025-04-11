import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDkj8HE82qmw7oPJM4vyY7Ktw15CaEyqok",
            authDomain: "fast-room-rental.firebaseapp.com",
            projectId: "fast-room-rental",
            storageBucket: "fast-room-rental.firebasestorage.app",
            messagingSenderId: "899216462209",
            appId: "1:899216462209:web:6ed8dcd4cf4e91a6111880",
            measurementId: "G-KT5J3DVFP9"));
  } else {
    await Firebase.initializeApp();
  }
}
