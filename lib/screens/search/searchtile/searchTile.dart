import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:student_app/screens/search/search_details.dart';

// ignore: must_be_immutable
class SearchTile extends StatelessWidget {
  SearchTile({super.key, required this.data});
  var data;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 240, 187, 30),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            leading: data['Image'] != null
                ? CircleAvatar(
                    radius: 34,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: data['Image'],
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Padding(
                          padding: EdgeInsets.all(5),
                          child: CircularProgressIndicator(
                              color: Color.fromARGB(255, 240, 187, 30),
                              backgroundColor: Colors.transparent),
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  )
                : const CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.black,
                  ),
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
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Details(
                  studentdetails: data,
                );
              }));
            },
          ),
        ],
      ),
    );
  }
}
