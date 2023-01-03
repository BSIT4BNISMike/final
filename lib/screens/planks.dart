import 'dart:io';
import 'package:befit/uploadFile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:befit/standards.dart';

import 'feedbacks.dart';

class Planks extends StatefulWidget {
  final week;
  final feedbackFiles;
  const Planks({Key? key, required this.week, this.feedbackFiles}) : super(key: key);

  @override
  State<Planks> createState() => _PlanksState();
}

class _PlanksState extends State<Planks> {
  var exercise;
  var week;
  var feedbackFiles;

  @override
  void initState() {
    exercise = "Planks";
    week = widget.week;
    feedbackFiles = widget.feedbackFiles;
    super.initState();
  }

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
              },
            );
          },
        ),
        title: Text(
          'Exercise',
          style: Standards.fontStyles["main"],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            child: Column(
              children: [
                //header
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
                        width: 300,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          'Planks',
                          style: Standards.fontStyles["mainButtonWhite"],
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 300,
                          width: 330,
                          child: Image(
                            image: NetworkImage(
                              'https://www.shape.com/thmb/Ro_fIawaVggDOAIQgBMux__X11U=/400x0/filters:no_upscale():max_bytes(150000):strip_icc()/low-plank-hold-b8a63da1ef844f00b6f6a21141ba1d87.jpg',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'NOTE: Please be sure to record yourself doing this workout with your left side part is seen in the camera.',
                            style: Standards.fontStyles["subtitle"],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '-	Lie on the floor and place your forearms directly under your shoulders',
                            style: Standards.fontStyles["subtitle"],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '-	With your feet together, slowly lift your torso off the floor by pressing into your forearms and knees.',
                            style: Standards.fontStyles["subtitle"],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '-	Contract your core as you lift your torso.',
                            style: Standards.fontStyles["subtitle"],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '-	Hold this position as tolerated or as prescribed.',
                            style: Standards.fontStyles["subtitle"],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '-	Do not hold your breath while maintaining the position.',
                            style: Standards.fontStyles["subtitle"],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  children: [
                    Container(
                      width: 145,
                      height: 50,
                      margin: EdgeInsets.all(Standards.bounds["minimargin"]!),
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
                              'Feedback',
                              style: Standards.fontStyles["miniWhite"],
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Feedbacks(feedbackFiles: feedbackFiles),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: 145,
                      height: 50,
                      margin: EdgeInsets.all(Standards.bounds["minimargin"]!),
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
                              'Upload',
                              style: Standards.fontStyles["miniWhite"],
                            ),
                          ],
                        ),
                        onPressed: () async {
                          await uploadFile(exercise, week);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     await uploadFile();
      //   },
      //   child: Text('Upload'),
      // ),
    );
  }
}
