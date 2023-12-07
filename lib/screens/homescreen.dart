import 'package:flutter/material.dart';
import 'package:student_app/db/function/db_function.dart';
import 'package:student_app/screens/addstudent/add_student.dart';
import 'package:student_app/screens/liststudent/list_student.dart';
import 'package:student_app/screens/search_screen.dart';
import 'package:student_app/screens/settings/drawer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    getallstudent();
    return Scaffold(
        key: _scaffoldKey,
        drawer: const Drawer(
          backgroundColor: Color.fromARGB(255, 15, 14, 14),
          surfaceTintColor: Color.fromARGB(255, 82, 82, 82),
          elevation: 10,
          width: 280,
          child: Drawer1(),
        ),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              'WELCOME',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                )),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: Search(),
                      );
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )),
              ),
            ],
            backgroundColor: const Color.fromARGB(255, 20, 19, 19)),
        body: SafeArea(
            child: Container(
          color: const Color.fromARGB(251, 23, 22, 22),
          child: Column(
            children: [
              const Flexible(
                  flex: 8,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Liststudent(),
                  )),
              Flexible(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    color: const Color.fromARGB(251, 23, 22, 22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (ctx) {
                                return const Studentadd();
                              }));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 240, 187, 30)),
                            child: const Text(
                              'Add student',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                  ))
            ],
          ),
        )));
  }
}
