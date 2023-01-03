import 'package:befit/screens/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:befit/standards.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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
              'BeFit',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 70.0,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient,
              ),
            ),
            Text(
              'Everybody Can Train',
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
                    '    Get Started    ',
                    style: Standards.fontStyles["mainButtonColored"],
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                    settings: const RouteSettings(name: "/mainPage"),
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
