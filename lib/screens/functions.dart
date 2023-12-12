import 'package:flutter/material.dart';
import 'package:student_app/screens/addstudent/add_student.dart';
import 'package:student_app/screens/addstudent/addtile.dart';
import 'package:student_app/screens/editstudent/editTile.dart';
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
  if (formkey.currentState!.validate() && image != null) {
    if (uploading == false) {
      await addfirebase();
      // ignore: use_build_context_synchronously
      snackbar('Submitted', context);
      // ignore: use_build_context_synchronously
      await clearcontroller();
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    } else {
      snackbar('Photo processing please wait', context);
    }
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

addfirebase() async {
  final data = {
    'Name': namecontroller.text,
    'Age': agecontroller.text,
    'Phone Number': phonecontroller.text,
    'Place': placecontroller.text,
    'Image': imageUrl,
  };
  await firedata.add(data);
  imageUrl = null;
}

deletefirebase(id) {
  firedata.doc(id).delete();
}
