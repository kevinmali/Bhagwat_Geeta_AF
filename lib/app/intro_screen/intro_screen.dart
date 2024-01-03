import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class intro_page extends StatelessWidget {
  const intro_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome to Bhagwat Geeta ",
            body:
                "Welcome to Bhagwat Geeta.This is a description of how it Redding.",
            image: Center(
              child: Container(
                // margin: EdgeInsets.only(top: 20),
                height: 460,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage("lib/asset/Gif/bhagwatgeeta.gif"),
                        fit: BoxFit.cover)),
              ),
            ),
            decoration: const PageDecoration(
              pageColor: Colors.black,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
              bodyTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Colors.white),
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
            decoration: const PageDecoration(
              pageColor: Colors.black,
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
              bodyTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Colors.white),
            ),
          ),
        ],
        done: Text(
          "done",
          style: GoogleFonts.acme(color: Colors.black, fontSize: 20),
        ),
        onDone: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setBool("isIntroVisited", true);
          Navigator.pushReplacementNamed(context, 'Home');
        },
        next: Text(
          "Next",
          style: GoogleFonts.acme(color: Colors.black, fontSize: 20),
        ),
        showNextButton: true,
        dotsDecorator: DotsDecorator(
          // size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.black,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    );
  }
}
