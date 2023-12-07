import 'package:flutter/material.dart';
import 'package:student_app/screens/settings/about.dart';
import 'package:student_app/screens/settings/privacy.dart';
import 'package:student_app/screens/settings/terms.dart';

class Drawer1 extends StatelessWidget {
  const Drawer1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: 9,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Text(
                              'Settings',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 203, 200, 200),
                                  fontSize: 25,
                                  fontFamily: 'SLASHI',
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          Row(
                            children: [
                              Builder(builder: (BuildContext context) {
                                return IconButton(
                                    onPressed: () {
                                      Scaffold.of(context).closeDrawer();
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Color.fromARGB(255, 203, 200, 200),
                                    ));
                              }),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Ink(
                        height: 60,
                        width: 300,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return const Privacy();
                            }));
                          },
                          child: const Row(
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                'Privacy and Policy',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 203, 200, 200),
                                    fontSize: 17,
                                    fontFamily: 'SLASHI',
                                    fontWeight: FontWeight.w800),
                              )
                            ],
                          ),
                        ),
                      ),
                      Ink(
                        height: 60,
                        width: 300,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return const Terms();
                            }));
                          },
                          child: const Row(
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                'Terms and Conditions ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 203, 200, 200),
                                    fontFamily: 'SLASHI',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800),
                              )
                            ],
                          ),
                        ),
                      ),
                      Ink(
                        height: 60,
                        width: 300,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return const About();
                            }));
                          },
                          child: const Row(
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                'About',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 203, 200, 200),
                                    fontFamily: 'SLASHI',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              const Flexible(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Version 1.0v',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'SLASHI'),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
