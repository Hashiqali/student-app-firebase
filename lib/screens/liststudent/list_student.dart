import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:flutter/material.dart';


import 'package:student_app/screens/liststudent/listTile.dart';


class Liststudent extends StatefulWidget {

  const Liststudent({super.key});


  @override

  State<Liststudent> createState() => _ListstudentState();

}


final CollectionReference firedata =

    FirebaseFirestore.instance.collection('Studentmodel');


class _ListstudentState extends State<Liststudent> {

  List a = [];


  @override

  Widget build(BuildContext context) {

    return StreamBuilder(

        stream: firedata.snapshots(),

        builder: (ctx, AsyncSnapshot snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {

            return const CircularProgressIndicator();

          } else if (snapshot.hasError) {

            return Text('Error: ${snapshot.error}');

          } else {

            List<QueryDocumentSnapshot> value =

                snapshot.data!.docs; // Use docs() method here


            final allvalues = value.reversed.toList();


            if (allvalues.isEmpty) {

              return const Center(

                child: Text(

                  'No data',

                  style: TextStyle(color: Colors.white),

                ),

              );

            }


            if (snapshot.data.docs.isEmpty) {

              return const Center(

                child: Text(

                  'No data',

                  style: TextStyle(color: Colors.white),

                ),

              );

            }


            if (snapshot.hasData) {

              return SafeArea(

                child: ListView.separated(

                    itemBuilder: (ctx, index) {

                      DocumentSnapshot data = allvalues[index];


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

          }

        });

  }

}

