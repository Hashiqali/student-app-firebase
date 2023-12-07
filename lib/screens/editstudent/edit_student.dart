import 'package:flutter/material.dart';
import 'package:student_app/db/model/db_model.dart';
import 'package:student_app/screens/editstudent/editTile.dart';

final namecontrollers = TextEditingController();

final agecontrollers = TextEditingController();

final phonecontrollers = TextEditingController();

final placecontrollers = TextEditingController();

class Updatepage extends StatefulWidget {
  const Updatepage({super.key, required this.studentdetails});
  final Studentmodel studentdetails;
  @override
  State<Updatepage> createState() => _UpdatepageState();
}

class _UpdatepageState extends State<Updatepage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Edit student details',
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 20, 19, 19),
      ),
      body: EditTile(studentdetails: widget.studentdetails),
    );
  }
}
