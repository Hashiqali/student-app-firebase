import 'package:flutter/material.dart';


import 'package:student_app/screens/addstudent/add_student.dart';


import 'package:student_app/screens/editstudent/editTile.dart';


// ignore: must_be_immutable


class Updatepage extends StatefulWidget {

  Updatepage({super.key, required this.studentdetails});


  var studentdetails;


  @override

  State<Updatepage> createState() => _UpdatepageState();

}


class _UpdatepageState extends State<Updatepage> {

  final namecontrollers = TextEditingController();


  final agecontrollers = TextEditingController();


  final phonecontrollers = TextEditingController();


  final placecontrollers = TextEditingController();


  @override

  void initState() {

    image = null;


    super.initState();

  }


  @override

  void dispose() {

    namecontrollers.dispose();


    agecontrollers.dispose();


    phonecontrollers.dispose();


    placecontrollers.dispose();


    super.dispose();

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

      body: EditTile(

          studentdetails: widget.studentdetails,

          agecontrollers: agecontrollers,

          namecontrollers: namecontrollers,

          phonecontrollers: phonecontrollers,

          placecontrollers: placecontrollers),

    );

  }

}

