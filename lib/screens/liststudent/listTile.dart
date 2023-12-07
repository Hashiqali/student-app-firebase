import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_app/db/function/db_function.dart';
import 'package:student_app/db/model/db_model.dart';
import 'package:student_app/screens/editstudent/edit_student.dart';
import 'package:student_app/screens/functions.dart';

// ignore: must_be_immutable
class Listtile extends StatelessWidget {
  Listtile({super.key, required this.data});
  DocumentSnapshot data;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 240, 187, 30),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            // leading: CircleAvatar(
            //   radius: 34,
            //   backgroundImage: FileImage(File(data.image)),
            // ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name : ${data['Name']}',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Age : ${data['Age']}',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Phone : ${data['Phone Number']}',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Place : ${data['Place']}',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) {
                        //     return Updatepage(
                        //       studentdetails: data,
                        //     );
                        //   },
                        // ));
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )),
                  IconButton(
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                backgroundColor: Colors.amber.shade500,
                                content: const Text('Do you want to delete ?'),
                                // actions: [
                                //   TextButton(
                                //       onPressed: () {
                                //         if (data.id != null) {
                                //           deletestudent(data.id!);
                                //           Navigator.of(context).pop();
                                //           snackbar(
                                //               'Deleted Successfully', context);
                                //         }
                                //       },
                                //       child: const Text(
                                //         'Yes',
                                //         style: TextStyle(color: Colors.black),
                                //       )),
                                //   TextButton(
                                //       onPressed: () {
                                //         Navigator.of(ctx).pop();
                                //       },
                                //       child: const Text('No',
                                //           style:
                                //               TextStyle(color: Colors.black))),
                                // ],
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 253, 17, 0),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
