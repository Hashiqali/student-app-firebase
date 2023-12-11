import 'package:flutter/material.dart';
import 'package:student_app/screens/addstudent/add_student.dart';
import 'package:student_app/screens/addstudent/addtile.dart';
import 'package:student_app/screens/editstudent/edit_student.dart';
import 'package:student_app/screens/liststudent/list_student.dart';

snackbar(text, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    backgroundColor: const Color.fromARGB(255, 63, 62, 62),
    margin: const EdgeInsets.all(50),
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
    ),
  ));
}

Future<void> addstudent(BuildContext context) async {
  if (formkey.currentState!.validate() && image1 != null) {
    addfirebase();

    await clearcontroller();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();

    // ignore: use_build_context_synchronously
    snackbar('Submitted', context);
  } else {
    snackbar('Please add photo', context);
  }
}

clearcontroller() {
  namecontroller.text = '';
  agecontroller.text = '';
  phonecontroller.text = '';
  placecontroller.text = '';
}

addfirebase() {
  final data = {
    'Name': namecontroller.text,
    'Age': agecontroller.text,
    'Phone Number': phonecontroller.text,
    'Place': placecontroller.text,
    'Image': imageUrl,
  };
  firedata.add(data);
}

updatefirebase(id, context) {
  final data = {
    'Name': namecontrollers.text,
    'Age': agecontrollers.text,
    'Phone Number': phonecontrollers.text,
    'Place': placecontrollers.text,
    'Image': imageUrl,
  };
  firedata.doc(id).update(data);
  snackbar('Updated', context);
}

deletefirebase(id) {
  firedata.doc(id).delete();
}
