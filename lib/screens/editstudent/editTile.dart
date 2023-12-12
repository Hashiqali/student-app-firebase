import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_app/screens/addstudent/add_student.dart';
import 'package:student_app/screens/addstudent/addtile.dart';
import 'package:student_app/screens/editstudent/edit_student.dart';
import 'package:student_app/screens/functions.dart';
import 'package:student_app/screens/home_screen/homescreen.dart';
import 'package:student_app/screens/liststudent/list_student.dart';

bool uploadingedit = false;

// ignore: must_be_immutable
class EditTile extends StatefulWidget {
  EditTile(
      {super.key,
      required this.studentdetails,
      required this.agecontrollers,
      required this.namecontrollers,
      required this.phonecontrollers,
      required this.placecontrollers});
  final studentdetails;
  TextEditingController placecontrollers;
  TextEditingController phonecontrollers;
  TextEditingController agecontrollers;
  TextEditingController namecontrollers;

  @override
  State<EditTile> createState() => _EditTileState();
}

class _EditTileState extends State<EditTile> {
  final GlobalKey<FormState> key2 = GlobalKey<FormState>();

  @override
  void initState() {
    widget.namecontrollers.text = widget.studentdetails['Name'];

    widget.agecontrollers.text = widget.studentdetails['Age'];

    widget.phonecontrollers.text = widget.studentdetails['Phone Number'];

    widget.placecontrollers.text = widget.studentdetails['Place'];
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
                    image == null
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
                        : uploadingedit
                            ? const CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.black,
                                child: CircularProgressIndicator(
                                    color: Color.fromARGB(255, 240, 187, 30),
                                    backgroundColor: Colors.transparent),
                              )
                            : CircleAvatar(
                                radius: 40,
                                backgroundImage: MemoryImage(imagebyte!)),
                    Positioned(
                      bottom: -10,
                      left: 42,
                      child: IconButton(
                          onPressed: () {
                            fromgallery();
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
                            controller: widget.namecontrollers,
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
                            controller: widget.agecontrollers,
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
                            controller: widget.phonecontrollers,
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
                            controller: widget.placecontrollers,
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
                              onPressed: () async {
                                if (widget.studentdetails['Name'] ==
                                        widget.namecontrollers.text &&
                                    widget.studentdetails['Age'] ==
                                        widget.agecontrollers.text &&
                                    widget.studentdetails['Phone Number'] ==
                                        widget.phonecontrollers.text &&
                                    widget.studentdetails['Place'] ==
                                        widget.placecontrollers.text &&
                                    image == null) {
                                  snackbar('No changes', context);
                                } else {
                                  if (key2.currentState!.validate() &&
                                      widget.studentdetails['Image'] != null) {
                                    if (uploadingedit == false) {
                                      await updatefirebase(
                                          widget.studentdetails.id,
                                          context,
                                          widget.studentdetails['Image']);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (ctx) {
                                        return const Homescreen();
                                      }));
                                      snackbar('Updated', context);
                                    } else {
                                      snackbar('Photo processing please wait',
                                          context);
                                    }
                                  } else {
                                    snackbar('Please add photo', context);
                                  }
                                }
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

  Future<void> fromgallery() async {
    FilePickerResult? img1 = await FilePicker.platform.pickFiles();

    if (img1 != null) {
      setState(() {
        image = img1.files.first.name;
        imagebyte = img1.files.first.bytes;
      });
    }

    try {
      // Show the circular indicator while waiting for the imageUrl
      setState(() {
        uploadingedit = true;
      });

      firebase_storage.UploadTask uploadTask;
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('Product')
          .child('/${image!}');
      final metadata =
          firebase_storage.SettableMetadata(contentType: 'image/jpeg');
      uploadTask = ref.putData(imagebyte!, metadata);

      await uploadTask.whenComplete(() => null);

      imageUrl = await ref.getDownloadURL();
      print(imageUrl);

      setState(() {
        uploadingedit = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        uploadingedit = false;
      });
    }
  }

  updatestudents(id, context, nullimage) async {
    if (widget.studentdetails['Name'] == widget.namecontrollers.text &&
        widget.studentdetails['Age'] == widget.agecontrollers.text &&
        widget.studentdetails['Phone Number'] == widget.phonecontrollers.text &&
        widget.studentdetails['Place'] == widget.placecontrollers.text) {
      snackbar('No changes', context);
    } else {
      if (key2.currentState!.validate() &&
          widget.studentdetails['Image'] != null) {
        if (uploadingedit == false) {
          await updatefirebase(id, context, nullimage);
          snackbar('Updated', context);
        } else {
          snackbar('Photo processing please wait', context);
        }
      } else {
        snackbar('Please add photo', context);
      }
    }
  }

  updatefirebase(id, context, nullimage) {
    final data = {
      'Name': widget.namecontrollers.text,
      'Age': widget.agecontrollers.text,
      'Phone Number': widget.phonecontrollers.text,
      'Place': widget.placecontrollers.text,
      'Image': imageUrl ?? widget.studentdetails['Image'],
    };
    firedata.doc(id).update(data);
    snackbar('Updated', context);
  }
  // Future<void> fromgallery() async {
  //   FilePickerResult? img1 = await FilePicker.platform.pickFiles();

  //   if (img1 != null) {
  //     setState(() {
  //       image = img1.files.first.name;
  //       imagebyte = img1.files.first.bytes;
  //     });
  //   }

  //   try {
  //     firebase_storage.UploadTask uploadTask;
  //     firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
  //         .ref()
  //         .child('Product')
  //         .child('/${image!}');
  //     final metadata =
  //         firebase_storage.SettableMetadata(contentType: 'image/jpeg');
  //     uploadTask = ref.putData(imagebyte!, metadata);
  //     await uploadTask.whenComplete(() => null);
  //     imageUrl = await ref.getDownloadURL();
  //     print(imageUrl);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
