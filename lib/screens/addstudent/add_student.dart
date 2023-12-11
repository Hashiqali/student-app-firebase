import 'dart:io';
import 'package:flutter/material.dart';
import 'package:student_app/screens/addstudent/addtile.dart';

File? image1;
String? image;
final GlobalKey<FormState> formkey = GlobalKey<FormState>();

final namecontroller = TextEditingController();

final agecontroller = TextEditingController();

final phonecontroller = TextEditingController();

final placecontroller = TextEditingController();

class Studentadd extends StatefulWidget {
  const Studentadd({super.key});

  @override
  State<Studentadd> createState() => _StudentaddState();
}

class _StudentaddState extends State<Studentadd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.all(21),
            child: Text(
              'Please enter details',
              style: TextStyle(
                  color: Color.fromARGB(255, 254, 254, 254),
                  fontWeight: FontWeight.w300),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 20, 19, 19)),
      body: const Addtile(),
    );
  }
}
