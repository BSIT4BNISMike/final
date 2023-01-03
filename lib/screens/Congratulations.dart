import 'package:befit/screens/bmi_calculator.dart';
import 'package:flutter/material.dart';
import 'package:befit/standards.dart';
import 'package:befit/screens/sign_up.dart';
import 'package:google_fonts/google_fonts.dart';

class Congrats extends StatefulWidget {
  @override
  _CongratsState createState() => _CongratsState();
}

class _CongratsState extends State<Congrats> {
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color(0xFFA8C0FB),
      Color(0xFFB9AAF5),
    ],
  ).createShader(
    const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Congratulations',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 43.0,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient,
              ),
            ),
            Text(
              'Job Well Done!!!',
              style: Standards.fontStyles["subtitle"],
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Standards.colors["whiteColor"],
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    '    Start Again    ',
                    style: Standards.fontStyles["mainButtonColored"],
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BMI(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
