import 'package:flutter/material.dart';
import 'package:student_app/screens/home_screen/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAeZM1j_0ChGNBGULAupo_ZDw7BRGWRF1Y",
          authDomain: "student-app-397ae.firebaseapp.com",
          projectId: "student-app-397ae",
          storageBucket: "student-app-397ae.appspot.com",
          messagingSenderId: "840014197662",
          appId: "1:840014197662:web:573e7a5c0811b853889c8f",
          measurementId: "G-8GHG25WX4J"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
