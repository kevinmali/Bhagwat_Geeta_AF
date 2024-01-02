import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class intro_page extends StatelessWidget {
  const intro_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome to Bhagwat Geeta ",
            body:
                "Welcome to Bhagwat Geeta.This is a description of how it Redding.",
            image: Center(
              child: Container(
                height: 460,
                width: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/asset/Gif/bhagwatgeeta.gif"),
                        fit: BoxFit.fill)),
              ),
            ),
          ),
          PageViewModel(
            title: "Welcome to Bhagwat Geeta",
            body:
                "Welcome to Bhagwat Geeta.This is a description of how it Redding.",
            image: Center(
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "lib/asset/Gif/the-bhagavad-gita-lord-krishna.gif"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
        done: Text(
          "done",
          style: GoogleFonts.acme(color: Colors.white, fontSize: 20),
        ),
        onDone: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setBool("isIntroVisited", true);
          Navigator.pushReplacementNamed(context, 'Home');
        },
        next: Text(
          "Next",
          style: GoogleFonts.acme(color: Colors.white, fontSize: 20),
        ),
        showNextButton: true,
        dotsContainerDecorator: BoxDecoration(color: Colors.black),
      ),
    );
  }
}
