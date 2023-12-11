import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Details extends StatelessWidget {
  var studentdetails;
  Details({super.key, required this.studentdetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade500,
        title: const Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(right: 60),
            child: Text(
              'Details',
              style: TextStyle(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(251, 23, 22, 22),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Card(
                  color: Colors.amber.shade500,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      ListTile(
                        leading: studentdetails['Image'] != null
                            ? CircleAvatar(
                                radius: 34,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: studentdetails['Image'],
                                    width: 56,
                                    height: 56,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        const Padding(
                                      padding: EdgeInsets.all(5),
                                      child: CircularProgressIndicator(
                                          color:
                                              Color.fromARGB(255, 240, 187, 30),
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
                            : const CircleAvatar(
                                radius: 32,
                                backgroundColor: Colors.black,
                                backgroundImage:
                                    AssetImage('assets/images/graduated.png'),
                              ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name : ${studentdetails['Name']}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Age : ${studentdetails['Age']}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Phone : ${studentdetails['Phone Number']}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Place : ${studentdetails['Place']}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
