import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'About',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'SLASHI',
              fontWeight: FontWeight.w800),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              '     About Student Details Manager\n\n                    Welcome to the Student Details Manager ,an intuitive and efficient application designed to streamline the process of managing student information. This app is tailored to meet the needs of educators, administrators, and anyone involved in organizing and maintaining student records\n\nKey Features:\n   User-Friendly Interface:  The app boasts a user-friendly interface that makes navigating and managing student details a breeze. With a clean design and intuitive controls, users can easily input, update, and retrieve information.\n\n   Comprehensive Student Profiles: Create and maintain comprehensive profiles for each student, including personal details, contact information, academic records, attendance history, and more. The app ensures that all necessary data is organized and readily accessible.\n\nSincerely, Hashiq Ali',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
