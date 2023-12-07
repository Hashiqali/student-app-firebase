import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/screens/addstudent/add_student.dart';
import 'package:student_app/screens/functions.dart';

class Addtile extends StatefulWidget {
  const Addtile({super.key});

  @override
  State<Addtile> createState() => _AddtileState();
}

class _AddtileState extends State<Addtile> {
  @override
  void initState() {
    setState(() {
      image1 = null;
    });
    super.initState();
  }
  // void dispose() {

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(251, 23, 22, 22),
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 45,
                            backgroundImage: image1 != null
                                ? FileImage(image1!)
                                : const AssetImage(
                                        'assets/images/graduated.png')
                                    as ImageProvider,
                          ),
                          Positioned(
                            bottom: -10,
                            right: -12,
                            child: IconButton(
                                onPressed: () {
                                  option();
                                },
                                icon: const Icon(
                                  Icons.add_a_photo,
                                  color: Color.fromARGB(255, 88, 86, 86),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 80,
                        width: 300,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                          controller: namecontroller,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(15)
                          ],
                          decoration: const InputDecoration(
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 197, 195, 195)),
                              suffixIconColor:
                                  Color.fromARGB(255, 197, 195, 195),
                              suffixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                              labelText: ' Name'),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 80,
                        width: 300,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter age';
                            }
                            return null;
                          },
                          controller: agecontroller,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2)
                          ],
                          decoration: const InputDecoration(
                              suffixIconColor:
                                  Color.fromARGB(255, 197, 195, 195),
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 197, 195, 195)),
                              suffixIcon: Icon(Icons.date_range),
                              border: OutlineInputBorder(),
                              labelText: ' Age'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 80,
                        width: 300,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter phone number';
                            }
                            return null;
                          },
                          controller: phonecontroller,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          decoration: const InputDecoration(
                            suffixIconColor: Color.fromARGB(255, 197, 195, 195),
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 197, 195, 195)),
                            suffixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(),
                            labelText: ' Phone Number',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 80,
                        width: 300,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter place';
                            }
                            return null;
                          },
                          controller: placecontroller,
                          decoration: const InputDecoration(
                              suffixIconColor:
                                  Color.fromARGB(255, 197, 195, 195),
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 197, 195, 195)),
                              suffixIcon: Icon(Icons.place),
                              border: OutlineInputBorder(),
                              labelText: ' Place'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40,
                        width: 300,
                        child: ElevatedButton(
                            onPressed: () {
                              addstudent(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 240, 187, 30)),
                            child: const Text(
                              'Add studdent',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
          backgroundColor: Colors.amber.shade500,
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
}
