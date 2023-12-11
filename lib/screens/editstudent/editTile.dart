import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/screens/addstudent/add_student.dart';
import 'package:student_app/screens/addstudent/addtile.dart';
import 'package:student_app/screens/editstudent/edit_student.dart';
import 'package:student_app/screens/functions.dart';
import 'package:student_app/screens/home_screen/homescreen.dart';

class EditTile extends StatefulWidget {
  const EditTile({super.key, required this.studentdetails});
  final studentdetails;
  @override
  State<EditTile> createState() => _EditTileState();
}

class _EditTileState extends State<EditTile> {
  final GlobalKey<FormState> key2 = GlobalKey<FormState>();
  @override
  void initState() {
    namecontrollers.text = widget.studentdetails['Name'];
    agecontrollers.text = widget.studentdetails['Age'];
    phonecontrollers.text = widget.studentdetails['Phone Number'];
    placecontrollers.text = widget.studentdetails['Place'];
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
                    image1 == null
                        ? CircleAvatar(
                            radius: 40,
                            child: ClipOval(
                              clipBehavior: Clip.antiAlias,
                              child: CachedNetworkImage(
                                imageUrl: widget.studentdetails['Image'],
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: CircularProgressIndicator(
                                      color: Color.fromARGB(255, 240, 187, 30),
                                      backgroundColor: Colors.transparent),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          )
                        : CircleAvatar(
                            radius: 40,
                            backgroundImage: FileImage(image1!),
                          ),
                    Positioned(
                      bottom: -10,
                      left: 42,
                      child: IconButton(
                          onPressed: () {
                            option();
                          },
                          icon: const Icon(
                            Icons.add_a_photo,
                            color: Color.fromARGB(192, 231, 227, 227),
                            size: 20,
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
                                updatefirebase(
                                    widget.studentdetails.id, context);
                                setState(() {
                                  image1 = null;
                                });
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return const Homescreen();
                                }));
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
    try {
      String fileName = DateTime.now().microsecondsSinceEpoch.toString();
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDireImage = referenceRoot.child('images');
      Reference referenceImageToUpload = referenceDireImage.child(fileName);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      await referenceImageToUpload.putFile(File(img1!.path));
      imageUrl = await referenceImageToUpload.getDownloadURL();
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<void> fromcamera() async {
    final img1 = await ImagePicker().pickImage(source: ImageSource.camera);

    if (img1 != null) {
      setState(() {
        image1 = File(img1.path);
        image = image1!.path;
      });
    }
    try {
      String fileName = DateTime.now().microsecondsSinceEpoch.toString();
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDireImage = referenceRoot.child('images');
      Reference referenceImageToUpload = referenceDireImage.child(fileName);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      await referenceImageToUpload.putFile(File(img1!.path));
      imageUrl = await referenceImageToUpload.getDownloadURL();
    } catch (e) {
      print(e);
    } finally {}
  }
}
