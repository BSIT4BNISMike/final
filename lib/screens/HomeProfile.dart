import 'dart:developer';

import 'package:befit/query.dart';
import 'package:befit/screens/A1ToA3.dart';
import 'package:befit/screens/C1ToC3.dart';
import 'package:befit/screens/D1.dart';
import 'package:befit/screens/D2.dart';
import 'package:befit/screens/D3.dart';
import 'package:befit/screens/E1.dart';
import 'package:befit/screens/E2.dart';
import 'package:befit/screens/E3.dart';
import 'package:befit/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:befit/screens/panel.dart';
import 'package:befit/standards.dart';

import 'B1ToB3.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> userDetails = {};

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Standards.colors["blackColor"],
          ),
          // TODO: Implement Back Button
          // Tapping Back Button will return to the ROUTES TESTER (temporary)
          onPressed: () {
            setState(
              () {
                Navigator.pop(context);
                /*Navigator.popUntil(context, ModalRoute.withName('/mainPage'));*/
              },
            );
          },
        ),
        title: Text(
          'Home',
          style: Standards.fontStyles["main"],
        ),
      ),
      body: FutureBuilder(
        future: getUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            userDetails = snapshot.data!.data()!;
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  child: Column(
                    children: [
                      // Header
                      Container(
                        width: deviceWidth,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 204, 144, 236),
                              Color.fromARGB(255, 153, 110, 180),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 180,
                              height: 70,
                              alignment: Alignment.center,
                              child: Text(
                                'User Profile',
                                style: Standards.fontStyles["mainButtonWhite"],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Divider(
                      //     height: 18,
                      //     thickness: 5,
                      //     color: Standards.colors["primaryColorLight"]),

                      // Profile picture
                      // Container(
                      //   width: 200,
                      //   height: 200,
                      //   decoration: BoxDecoration(
                      //     gradient: const LinearGradient(
                      //       colors: [
                      //         Color.fromARGB(255, 204, 144, 236),
                      //         Color.fromARGB(255, 153, 110, 180),
                      //       ],
                      //     ),
                      //     borderRadius: BorderRadius.circular(100),
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       Container(
                      //         width: 110,
                      //         height: 80,
                      //         alignment: Alignment.center,
                      //         child: Text(
                      //           'Profile Picture',
                      //           style: Standards.fontStyles["mainButtonWhite"],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Divider(
                          height: 18,
                          thickness: 5,
                          color: Standards.colors["primaryColorLight"]),

                      Column(
                        children: [
// Username
                          Container(
                            width: deviceWidth,
                            height: 70,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 204, 144, 236),
                                  Color.fromARGB(255, 153, 110, 180),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Username: ${userDetails['username']}',
                                    style: Standards.fontStyles["mainWhite"],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                          height: 18,
                          thickness: 5,
                          color: Standards.colors["primaryColorLight"]),

                      // Dateofbirth
                      Column(
                        children: [
                          Container(
                            width: deviceWidth,
                            height: 70,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 252, 116, 190),
                                  Color.fromARGB(255, 202, 36, 180),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Date of birth: ${userDetails['birthday']}',
                                    style: Standards.fontStyles["mainWhite"],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                          height: 18,
                          thickness: 5,
                          color: Standards.colors["primaryColorLight"]),
// Sex
                      Column(
                        children: [
                          Container(
                            width: deviceWidth,
                            height: 70,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 204, 144, 236),
                                  Color.fromARGB(255, 153, 110, 180),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Sex: ${userDetails['sex']}',
                                    style: Standards.fontStyles["mainWhite"],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                          height: 18,
                          thickness: 5,
                          color: Standards.colors["primaryColorLight"]),
                      // bmi
                      Column(
                        children: [
                          Container(
                            width: deviceWidth,
                            height: 70,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 252, 116, 190),
                                  Color.fromARGB(255, 202, 36, 180),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(

                                    'BMI: ${userDetails['BMI']?.toStringAsFixed(2)}',
                                    style: Standards.fontStyles["mainWhite"],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                          height: 18,
                          thickness: 5,
                          color: Standards.colors["primaryColorLight"]),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.90,
                        margin:
                            EdgeInsets.only(top: Standards.bounds["margin"]!),
                        // Rounded button
                        child: ElevatedButton(
                          // Rounded button
                          style: ElevatedButton.styleFrom(
                            primary: Standards.colors["primaryColorDark"],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Standards.bounds["borderRadius"]!),
                            ),
                          ),
                          // Text with icon
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Exercises',
                                style: Standards.fontStyles["mainButtonWhite"],
                              ),
                              const VerticalDivider(
                                color: Colors.transparent,
                              ),
                              const Icon(Icons.arrow_forward_outlined,
                                  color: Colors.white),
                            ],
                          ),
                          onPressed: () {
                            Widget? panel;
                            switch(userDetails['exerciseRecommendation']){
                              case "A1": case "A2": case "A3":
                                panel = const A1();
                                break;
                              case "B1": case "B2": case "B3":
                                panel = const A2();
                                break;
                              case "C1": case "C2": case "C3":
                                panel = const A3();
                                break;
                              case "D1":
                                panel = const A4();
                                break;
                              case "D2":
                                panel = const A5();
                                break;
                              case "D3":
                                panel = const A6();
                                break;
                              case "E1":
                                panel = const A7();
                                break;
                              case "E2":
                                panel = const A8();
                                break;
                              case "E3":
                                panel = const A9();
                                break;
                            }

                            log(name: "EXERCISE RECOMMENDATION", userDetails['exerciseRecommendation']);

                            setState(
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => panel!,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Divider(
                          height: 18,
                          thickness: 5,
                          color: Standards.colors["primaryColorLight"]),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.90,
                        margin:
                            EdgeInsets.only(top: Standards.bounds["margin"]!),
                        // Rounded button
                        child: ElevatedButton(
                          // Rounded button
                          style: ElevatedButton.styleFrom(
                            primary: Standards.colors["primaryColorDark"],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Standards.bounds["borderRadius"]!),
                            ),
                          ),
                          // Text with icon
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Log Out',
                                style: Standards.fontStyles["mainButtonWhite"],
                              ),
                              const VerticalDivider(
                                color: Colors.transparent,
                              ),
                              const Icon(Icons.arrow_forward_outlined,
                                  color: Colors.white),
                            ],
                          ),
                          onPressed: () {
                            FirebaseAuth.instance.signOut().then((value) {
                              print("Signed Out");
                              Navigator.pop(context);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
