import 'package:flutter/material.dart';
import 'package:student_app/db/function/db_function.dart';
import 'package:student_app/db/model/db_model.dart';
import 'package:student_app/screens/addstudent/add_student.dart';
import 'package:student_app/screens/editstudent/editTile.dart';
import 'package:student_app/screens/editstudent/edit_student.dart';
import 'package:student_app/screens/homescreen.dart';
import 'package:student_app/screens/liststudent/list_student.dart';

snackbar(text, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Color.fromARGB(255, 63, 62, 62),
    margin: const EdgeInsets.all(50),
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
    ),
  ));
}

Future<void> addstudent(BuildContext context) async {
  final name = namecontroller.text.trim();
  final age = agecontroller.text.trim();
  final phone = phonecontroller.text.trim();
  final place = placecontroller.text.trim();

  if (formkey.currentState!.validate() && image1 != null) {
    addfirebase();
    final studentvalues = Studentmodel(
      name: name,
      age: age,
      phone: phone,
      place: place,
      image: image!,
    );
    await addstudent1(studentvalues);
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
  };
  firedata.add(data);
}
