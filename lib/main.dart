import 'package:flutter/material.dart';
import 'package:student_app/db/function/db_function.dart';
import 'package:student_app/screens/homescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyC2Dy6MzLkMHV5F_--YEg4rf84-a1J-xQc',
          appId: '1:840014197662:android:0f31acb34bc304e4889c8f',
          messagingSenderId: '840014197662',
          projectId: 'student-app-397ae'));
  await initializingdatabase();
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
