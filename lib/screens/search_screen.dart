import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student_app/db/function/db_function.dart';
import 'package:student_app/db/model/db_model.dart';
import 'package:student_app/screens/search_details.dart';

class Search extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textTheme: Typography.whiteCupertino,
      scaffoldBackgroundColor: const Color.fromARGB(255, 20, 19, 19),
      inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
        color: Colors.white,
      )),
      hintColor: Colors.white,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 35, 34, 34),
        toolbarTextStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  List data = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: studentlistNotifier,
        builder: (BuildContext context, List<Studentmodel> studentlist,
            Widget? child) {
          final songbox = studentlist.toList();
          final filtered = songbox
              .where((element) =>
                  element.name.toLowerCase().contains(query.toLowerCase()))
              .toList();
          if (query.isEmpty) {
            return Center(
                child: Lottie.asset(
                    height: 120,
                    'assets/animation/searching song animation.json'));
          } else if (filtered.isEmpty) {
            return Center(
              child: Lottie.asset(
                  height: 120,
                  'assets/animation/no searched song animation.json'),
            );
          }
          return ListView.builder(
            itemBuilder: (ctx, index) {
              final data = filtered[index];
              String nameval = data.name.toLowerCase();

              if ((nameval).contains(query.toLowerCase().trim())) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Details(
                        studentdetails: data,
                      );
                    }));
                  },
                  title: Text(
                    data.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: FileImage(File(data.image)),
                  ),
                );
              }
              return null;
            },
            itemCount: studentlist.length,
          );
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: studentlistNotifier,
        builder: (BuildContext context, List<Studentmodel> studentlist,
            Widget? child) {
          final songbox = studentlist.toList();
          final filtered = songbox
              .where((element) =>
                  element.name.toLowerCase().contains(query.toLowerCase()))
              .toList();
          return ListView.builder(
            itemBuilder: (ctx, index) {
              final data = filtered[index];
              String nameval = data.name.toLowerCase();
              if ((nameval).contains((query.toLowerCase().trim()))) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Details(
                        studentdetails: data,
                      );
                    }));
                  },
                  title: Text(data.name,
                      style: const TextStyle(color: Colors.white)),
                  leading: CircleAvatar(
                    backgroundImage: FileImage(File(data.image)),
                  ),
                );
              }

              return null;
            },
            itemCount: studentlist.length,
          );
        });
  }
}
