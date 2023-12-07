import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/db/function/db_function.dart';
import 'package:student_app/db/model/db_model.dart';
import 'package:student_app/screens/addstudent/add_student.dart';
import 'package:student_app/screens/editstudent/edit_student.dart';
import 'package:student_app/screens/functions.dart';
import 'package:student_app/screens/homescreen.dart';

class EditTile extends StatefulWidget {
  const EditTile({super.key, required this.studentdetails});
  final Studentmodel studentdetails;
  @override
  State<EditTile> createState() => _EditTileState();
}

class _EditTileState extends State<EditTile> {
  final GlobalKey<FormState> key2 = GlobalKey<FormState>();
  @override
  void initState() {
    namecontrollers.text = widget.studentdetails.name;
    agecontrollers.text = widget.studentdetails.age;
    phonecontrollers.text = widget.studentdetails.phone;
    placecontrollers.text = widget.studentdetails.place;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color.fromARGB(251, 23, 22, 22),
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: image1 != null
                          ? FileImage(image1!)
                          : FileImage(File(widget.studentdetails.image)),
                    ),
                    Positioned(
                      bottom: -8,
                      left: 40,
                      child: IconButton(
                          onPressed: () {
                            option();
                          },
                          icon: const Icon(
                            Icons.add_a_photo,
                            color: Colors.black,
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    key: key2,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                          width: 300,
                          child: TextFormField(
                            controller: namecontrollers,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(15)
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 197, 195, 195)),
                              suffixIconColor:
                                  Color.fromARGB(255, 197, 195, 195),
                              suffixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 216, 212, 212)),
                              ),
                              labelText: 'Name',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 244, 244, 244)),
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                          width: 300,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(2),
                            ],
                            controller: agecontrollers,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter age';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 244, 244, 244)),
                              ),
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 197, 195, 195)),
                              suffixIconColor:
                                  Color.fromARGB(255, 197, 195, 195),
                              suffixIcon: Icon(Icons.date_range),
                              border: OutlineInputBorder(),
                              labelText: 'Age',
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                          width: 300,
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            keyboardType: TextInputType.phone,
                            controller: phonecontrollers,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter phone number';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 244, 244, 244)),
                              ),
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 197, 195, 195)),
                              suffixIconColor:
                                  Color.fromARGB(255, 197, 195, 195),
                              suffixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(),
                              labelText: 'Phone no',
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                          width: 300,
                          child: TextFormField(
                            controller: placecontrollers,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter place';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 244, 244, 244)),
                              ),
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 197, 195, 195)),
                              suffixIconColor:
                                  Color.fromARGB(255, 197, 195, 195),
                              suffixIcon: Icon(Icons.place),
                              border: OutlineInputBorder(),
                              labelText: 'place',
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: ElevatedButton(
                              onPressed: () {
                                update(context, widget.studentdetails.id,
                                    context, widget.studentdetails.image);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 240, 187, 30)),
                              child: const Text(
                                'Update',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              )),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  option() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.green,
          content: const Text(
            'Photo options',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  fromcamera();
                },
                child: const Text(
                  'Camera',
                  style: TextStyle(color: Colors.black),
                )),
            TextButton(
              onPressed: () {
                fromgallery();
              },
              child: const Text(
                'Gallery',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> fromgallery() async {
    final img1 = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (img1 != null) {
      setState(() {
        image1 = File(img1.path);
        image = image1!.path;
      });
    }
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  Future<void> fromcamera() async {
    final img1 = await ImagePicker().pickImage(source: ImageSource.camera);

    if (img1 != null) {
      setState(() {
        image1 = File(img1.path);
        image = image1!.path;
      });
    }
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  Future<void> update(ctx, id, context, String images) async {
    final name = namecontrollers.text.trim();
    final age = agecontrollers.text.trim();
    final phone = phonecontrollers.text.trim();
    final place = placecontrollers.text.trim();

    if (key2.currentState!.validate()) {
      await updatestudent(
        id,
        name,
        age,
        phone,
        place,
        image != null ? image! : images,
      );
      clearcontroller();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) {
        return const Homescreen();
      }));

      snackbar('Updated', context);
    }
  }
}
