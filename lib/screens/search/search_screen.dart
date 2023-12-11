import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student_app/screens/liststudent/list_student.dart';
import 'package:student_app/screens/search/searchtile/searchTile.dart';

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
    return StreamBuilder(
        stream: firedata.snapshots(),
        builder: (ctx, AsyncSnapshot snapshot) {
          List filtered1 = snapshot.data?.docs?.toList() ?? [];
          final filtered = filtered1
              .where((element) =>
                  element['Name'].toLowerCase().contains(query.toLowerCase()))
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

          if (snapshot.hasData) {
            return SafeArea(
              child: ListView.separated(
                  itemBuilder: (ctx, index) {
                    final data = filtered[index];
                    String nameval = data['Name'].toLowerCase();
                    if ((nameval).contains(query.toLowerCase().trim())) {
                      return SearchTile(data: data);
                    }
                    return null;
                  },
                  separatorBuilder: (ctx, index) {
                    return const SizedBox(
                      height: 1,
                    );
                  },
                  itemCount: filtered.length),
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
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder(
        stream: firedata.snapshots(),
        builder: (ctx, AsyncSnapshot snapshot) {
          List filtered1 = snapshot.data?.docs?.toList() ?? [];
          final filtered = filtered1
              .where((element) =>
                  element['Name'].toLowerCase().contains(query.toLowerCase()))
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
          if (snapshot.hasData) {
            return SafeArea(
              child: ListView.separated(
                  itemBuilder: (ctx, index) {
                    final data = filtered[index];
                    String nameval = data['Name'].toLowerCase();

                    if ((nameval).contains((query.toLowerCase().trim()))) {
                      return SearchTile(data: data);
                    }
                    return null;
                  },
                  separatorBuilder: (ctx, index) {
                    return const SizedBox(
                      height: 1,
                    );
                  },
                  itemCount: filtered.length),
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
  }
}
