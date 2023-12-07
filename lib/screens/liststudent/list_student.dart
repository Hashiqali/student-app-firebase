import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_app/db/function/db_function.dart';
import 'package:student_app/db/model/db_model.dart';
import 'package:student_app/screens/liststudent/listTile.dart';

class Liststudent extends StatefulWidget {
  const Liststudent({super.key});

  @override
  State<Liststudent> createState() => _ListstudentState();
}

final CollectionReference firedata =
    FirebaseFirestore.instance.collection('Studentmodel');

class _ListstudentState extends State<Liststudent> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: firedata.snapshots(),
        builder: (ctx, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: ListView.separated(
                  itemBuilder: (ctx, index) {
                    final DocumentSnapshot data = snapshot.data.docs[index];

                    return Listtile(
                      data: data,
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const SizedBox(
                      height: 1,
                    );
                  },
                  itemCount: snapshot.data!.docs.length),
            );
          } else {
            return const Center(
              child: Text(
                'No data',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        });

    // ValueListenableBuilder(
    //     valueListenable: studentlistNotifier,
    //     builder:
    //         (BuildContext ctx, List<Studentmodel> studentlist, Widget? child) {
    //       final val = studentlist.reversed.toList();
    //       if (studentlist.isEmpty) {
    //         return const Center(
    //           child: Text(
    //             'No data',
    //             style: TextStyle(color: Colors.white),
    //           ),
    //         );
    //       }
    //       return SafeArea(
    //         child: ListView.separated(
    //             itemBuilder: (ctx, index) {
    //               final data = val[index];

    //               return Listtile(
    //                 data: data,
    //               );
    //             },
    //             separatorBuilder: (ctx, index) {
    //               return const SizedBox(
    //                 height: 1,
    //               );
    //             },
    //             itemCount: studentlist.length),
    //       );
    //     });
  }
}
