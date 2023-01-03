import 'package:befit/screens/BicycleCrunch.dart';
import 'package:befit/screens/Congratulations.dart';
import 'package:befit/screens/cobraPose.dart';
import 'package:befit/screens/extension.dart';
import 'package:befit/screens/prisonerSquats.dart';
import 'package:befit/screens/pushUps.dart';
import 'package:befit/screens/tricepDips.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:befit/screens/panel.dart';
import 'package:befit/standards.dart';

import '../query.dart';

class B1toB33rd extends StatefulWidget {
  @override
  State<B1toB33rd> createState() => _B1toB33rdState();
}

class _B1toB33rdState extends State<B1toB33rd> {
  var week = "3rd";
  var numOfExercises = 21;

  List<Map<String, dynamic>> prisonerSquatsFeedback = [];
  List<Map<String, dynamic>> bicycleCrunchFeedback = [];
  List<Map<String, dynamic>> extensionsFeedback = [];
  List<Map<String, dynamic>> tricepsDipsFeedback = [];
  List<Map<String, dynamic>> pushUpsFeedback = [];
  List<Map<String, dynamic>> cobraPoseFeedback = [];

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
            Navigator.popUntil(context, ModalRoute.withName('/mainPage'));
          },
        ),
        title: Text(
          'Recommendation',
          style: Standards.fontStyles["main"],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
          return Future<void>.delayed(const Duration(seconds: 1));
        },
        child: SingleChildScrollView(
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
                          width: 150,
                          height: 70,
                          alignment: Alignment.center,
                          child: Text(
                            'Exercises',
                            style: Standards.fontStyles["mainButtonWhite"],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Part 1
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 200,
                            height: 50,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Perform for 3 Week',
                              style: Standards.fontStyles["smallerMain"],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 230,
                            height: 50,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Number of Exercises: 6',
                              style: Standards.fontStyles["smallerMain"],
                            ),
                          ),
                        ],
                      ),
// Exercise 1
                      Container(
                        width: deviceWidth,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(
                                  width: 110,
                                  height: 130,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/prisonersquats.jpg"),
                                    height: 95,
                                    width: 95,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  width: 115,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Prisoner squats repeat 15 times for 3 sets',
                                    style: Standards.fontStyles["mainWhite"],
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  height: 45,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 252, 116, 190),
                                        Color.fromARGB(255, 202, 36, 180),
                                      ],
                                      stops: [1.0, 1.0],
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Standards.colors["whiteColor"],
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PrisonerSquats(
                                            week: week,
                                            feedbackFiles: prisonerSquatsFeedback,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20),
                              child: Container(
                                width: double.maxFinite,
                                height: 20,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 252, 116, 190),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                ),
                                child: FutureBuilder(
                                  future:
                                  downloadFeedbacks("Prisoner_Squats", week),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      prisonerSquatsFeedback = snapshot.data!;
                                      return Stack(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 252, 116, 190),
                                                  Color.fromARGB(
                                                      255, 202, 36, 180),
                                                ],
                                              ),
                                            ),
                                            width: (deviceWidth - 70) *
                                                (prisonerSquatsFeedback.length /
                                                    numOfExercises),
                                          ),
                                          Center(
                                            child: Text(
                                                "${(prisonerSquatsFeedback.length / numOfExercises * 100).toStringAsFixed(2)}%",
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                          )
                                        ],
                                      );
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const LinearProgressIndicator(
                                        color:
                                        Color.fromARGB(255, 202, 36, 180),
                                        backgroundColor:
                                        Color.fromARGB(255, 252, 116, 190),
                                      );
                                    } else {
                                      return const Center();
                                    }
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                      height: 18,
                      thickness: 5,
                      color: Standards.colors["primaryColorLight"]),

                  // Exercise 2
                  Column(
                    children: [
                      Container(
                        width: deviceWidth,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(
                                  width: 110,
                                  height: 170,
                                  child: Image(
                                    image:
                                        AssetImage("assets/images/bicyclecrunch.jpg"),
                                    height: 95,
                                    width: 95,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  width: 115,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Bicycle crunch repeat exercise 15 times for 3 sets',
                                    style: Standards.fontStyles["mainWhite"],
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  height: 45,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 204, 144, 236),
                                        Color.fromARGB(255, 153, 110, 180),
                                      ],
                                      stops: [1.0, 1.0],
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Standards.colors["whiteColor"],
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BicycleCrunch(
                                            week: week,
                                            feedbackFiles: bicycleCrunchFeedback,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20),
                              child: Container(
                                width: double.maxFinite,
                                height: 20,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 204, 144, 236),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                ),
                                child: FutureBuilder(
                                  future: downloadFeedbacks("Bicycle_Crunch", week),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      bicycleCrunchFeedback = snapshot.data!;
                                      return Stack(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 204, 144, 236),
                                                  Color.fromARGB(
                                                      255, 153, 110, 180),
                                                ],
                                              ),
                                            ),
                                            width: (deviceWidth - 70) *
                                                (bicycleCrunchFeedback.length /
                                                    numOfExercises),
                                          ),
                                          Center(
                                            child: Text(
                                                "${(bicycleCrunchFeedback.length / numOfExercises * 100).toStringAsFixed(2)}%",
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                          )
                                        ],
                                      );
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const LinearProgressIndicator(
                                        color:
                                        Color.fromARGB(255, 153, 110, 180),
                                        backgroundColor:
                                        Color.fromARGB(255, 204, 144, 236),
                                      );
                                    } else {
                                      return const Center();
                                    }
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                      height: 18,
                      thickness: 5,
                      color: Standards.colors["primaryColorLight"]),
// Exercise 3
                  Column(
                    children: [
                      Container(
                        width: deviceWidth,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(
                                  width: 110,
                                  height: 130,
                                  child: Image(
                                    image: AssetImage("assets/images/extension.jpg"),
                                    height: 95,
                                    width: 95,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  width: 115,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Extensions repeat exercise 15 times for 3 sets',
                                    style: Standards.fontStyles["mainWhite"],
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  height: 45,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 252, 116, 190),
                                        Color.fromARGB(255, 202, 36, 180),
                                      ],
                                      stops: [1.0, 1.0],
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Standards.colors["whiteColor"],
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Extension(
                                            week: week,
                                            feedbackFiles: extensionsFeedback,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20),
                              child: Container(
                                width: double.maxFinite,
                                height: 20,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 252, 116, 190),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                ),
                                child: FutureBuilder(
                                  future:
                                  downloadFeedbacks("Extensions", week),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      extensionsFeedback = snapshot.data!;
                                      return Stack(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 252, 116, 190),
                                                  Color.fromARGB(
                                                      255, 202, 36, 180),
                                                ],
                                              ),
                                            ),
                                            width: (deviceWidth - 70) *
                                                (extensionsFeedback.length /
                                                    numOfExercises),
                                          ),
                                          Center(
                                            child: Text(
                                                "${(extensionsFeedback.length / numOfExercises * 100).toStringAsFixed(2)}%",
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                          )
                                        ],
                                      );
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const LinearProgressIndicator(
                                        color:
                                        Color.fromARGB(255, 202, 36, 180),
                                        backgroundColor:
                                        Color.fromARGB(255, 252, 116, 190),
                                      );
                                    } else {
                                      return const Center();
                                    }
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                      height: 18,
                      thickness: 5,
                      color: Standards.colors["primaryColorLight"]),
// Exercise 4
                  Column(
                    children: [
                      Container(
                        width: deviceWidth,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(
                                  width: 110,
                                  height: 130,
                                  child: Image(
                                    image: AssetImage("assets/images/tricepdips.jpg"),
                                    height: 95,
                                    width: 95,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  width: 115,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Triceps Dips repeat 15 times for 3 sets',
                                    style: Standards.fontStyles["mainWhite"],
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  height: 45,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 204, 144, 236),
                                        Color.fromARGB(255, 153, 110, 180),
                                      ],
                                      stops: [1.0, 1.0],
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Standards.colors["whiteColor"],
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TricepDips(
                                            week: week,
                                            feedbackFiles: tricepsDipsFeedback,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20),
                              child: Container(
                                width: double.maxFinite,
                                height: 20,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 204, 144, 236),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                ),
                                child: FutureBuilder(
                                  future: downloadFeedbacks("Triceps_Dips", week),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      tricepsDipsFeedback = snapshot.data!;
                                      return Stack(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 204, 144, 236),
                                                  Color.fromARGB(
                                                      255, 153, 110, 180),
                                                ],
                                              ),
                                            ),
                                            width: (deviceWidth - 70) *
                                                (tricepsDipsFeedback.length /
                                                    numOfExercises),
                                          ),
                                          Center(
                                            child: Text(
                                                "${(tricepsDipsFeedback.length / numOfExercises * 100).toStringAsFixed(2)}%",
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                          )
                                        ],
                                      );
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const LinearProgressIndicator(
                                        color:
                                        Color.fromARGB(255, 153, 110, 180),
                                        backgroundColor:
                                        Color.fromARGB(255, 204, 144, 236),
                                      );
                                    } else {
                                      return const Center();
                                    }
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                      height: 18,
                      thickness: 5,
                      color: Standards.colors["primaryColorLight"]),

// Exercise 5
                  Column(
                    children: [
                      Container(
                        width: deviceWidth,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(
                                  width: 110,
                                  height: 130,
                                  child: Image(
                                    image: AssetImage("assets/images/pushups.jpg"),
                                    height: 95,
                                    width: 95,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  width: 115,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Push ups repeat 15 times for 3 sets',
                                    style: Standards.fontStyles["mainWhite"],
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  height: 45,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 252, 116, 190),
                                        Color.fromARGB(255, 202, 36, 180),
                                      ],
                                      stops: [1.0, 1.0],
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Standards.colors["whiteColor"],
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PushUps(
                                            week: week,
                                            feedbackFiles: pushUpsFeedback,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20),
                              child: Container(
                                width: double.maxFinite,
                                height: 20,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 252, 116, 190),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                ),
                                child: FutureBuilder(
                                  future:
                                  downloadFeedbacks("Push_Ups", week),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      pushUpsFeedback = snapshot.data!;
                                      return Stack(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 252, 116, 190),
                                                  Color.fromARGB(
                                                      255, 202, 36, 180),
                                                ],
                                              ),
                                            ),
                                            width: (deviceWidth - 70) *
                                                (pushUpsFeedback.length /
                                                    numOfExercises),
                                          ),
                                          Center(
                                            child: Text(
                                                "${(pushUpsFeedback.length / numOfExercises * 100).toStringAsFixed(2)}%",
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                          )
                                        ],
                                      );
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const LinearProgressIndicator(
                                        color:
                                        Color.fromARGB(255, 202, 36, 180),
                                        backgroundColor:
                                        Color.fromARGB(255, 252, 116, 190),
                                      );
                                    } else {
                                      return const Center();
                                    }
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                      height: 18,
                      thickness: 5,
                      color: Standards.colors["primaryColorLight"]),
// Exercise 6
                  Column(
                    children: [
                      Container(
                        width: deviceWidth,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(
                                  width: 110,
                                  height: 130,
                                  child: Image(
                                    image: AssetImage("assets/images/cobrapose.jpg"),
                                    height: 95,
                                    width: 95,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  width: 115,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Cobra pose repeat exercise 3 times',
                                    style: Standards.fontStyles["mainWhite"],
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  height: 45,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 204, 144, 236),
                                        Color.fromARGB(255, 153, 110, 180),
                                      ],
                                      stops: [1.0, 1.0],
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Standards.colors["whiteColor"],
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CobraPose(
                                            week: week,
                                            feedbackFiles: cobraPoseFeedback,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20),
                              child: Container(
                                width: double.maxFinite,
                                height: 20,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 204, 144, 236),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                ),
                                child: FutureBuilder(
                                  future: downloadFeedbacks("Cobra_Pose", week),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      cobraPoseFeedback = snapshot.data!;
                                      return Stack(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 204, 144, 236),
                                                  Color.fromARGB(
                                                      255, 153, 110, 180),
                                                ],
                                              ),
                                            ),
                                            width: (deviceWidth - 70) *
                                                (cobraPoseFeedback.length /
                                                    numOfExercises),
                                          ),
                                          Center(
                                            child: Text(
                                                "${(cobraPoseFeedback.length / numOfExercises * 100).toStringAsFixed(2)}%",
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                          )
                                        ],
                                      );
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const LinearProgressIndicator(
                                        color:
                                        Color.fromARGB(255, 153, 110, 180),
                                        backgroundColor:
                                        Color.fromARGB(255, 204, 144, 236),
                                      );
                                    } else {
                                      return const Center();
                                    }
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    margin: EdgeInsets.only(top: Standards.bounds["margin"]!),
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
                            'Next',
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
                        if (prisonerSquatsFeedback.length == numOfExercises &&
                            bicycleCrunchFeedback.length == numOfExercises &&
                            extensionsFeedback.length == numOfExercises &&
                            tricepsDipsFeedback.length == numOfExercises &&
                            pushUpsFeedback.length == numOfExercises &&
                            cobraPoseFeedback.length == numOfExercises) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Congrats(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
