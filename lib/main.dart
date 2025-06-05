import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:milat1453/giris.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
            options: const FirebaseOptions(
                apiKey: "AIzaSyDnRyEqHvHsLqKFsSvOIml7sb4ljoJvgQY",
                authDomain: "milat1453-10f91.firebaseapp.com",
                databaseURL:
                    "https://milat1453-10f91-default-rtdb.firebaseio.com",
                projectId: "milat1453-10f91",
                storageBucket: "milat1453-10f91.firebasestorage.app",
                messagingSenderId: "747252009082",
                appId: "1:747252009082:web:2cda93b1dcd64fc76813c3"))
        .then((value) {
      print("Firebase başarıyla başlatıldı (Web).");
    }).catchError((error) {
      print("Firebase başlatılamadı: $error");
    });
  } else {
    await Firebase.initializeApp().then((value) {
      print("Firebase başarıyla başlatıldı (Android-IOS).");
    }).catchError((error) {
      print("Firebase başlatılamadı: $error");
    });
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1))
        .then((value) => {FlutterNativeSplash.remove()});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Milat 1453',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.blue,
          selectionHandleColor: Colors.blue,
        ),
      ),
      home: const Giris(),
    );
  }
}
