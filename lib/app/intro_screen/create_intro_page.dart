import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen> {
  int selectedIndex = 0;

  List<Map<String, dynamic>> onboardingList = [
    {
      "title": "The Bhagavad Gita is a poem written in the Sanskrit language.",
      "subtitle":
          "700 verses are structured into several ancient Indian poetic meters,\n with the principal being the shloka (Anushtubh chanda). It has 18 chapters in total.",
      "image": "lib/asset/Gif/bhagwatgeeta.gif"
    },
    {
      "title": "Characters",
      "subtitle":
          "Arjuna, one of the five PandavasKrishna, Arjunas charioteer and guru who was actually an incarnation of Vishnu Sanjaya, \n counselor of the Kuru king Dhritarashtra (secondary narrator)Dhritarashtra, Kuru king (Sanjayas audience) and father of the Kauravas",
      "image": "lib/asset/Gif/the-bhagavad-gita-lord-krishna.gif"
    },
    {
      "title": "There are total 18 chapters and 700 verses in Gita",
      "subtitle":
          "Chapter 1: Arjuna Vishada Yoga (47 verses)\nChapter 2: Sankhya Yoga (72 verses)\nChapter 3: Karma Yoga (43 verses)",
      "image": "lib/asset/Images/intro.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          //App Intro slider
          Expanded(
            child: PageView.builder(
              itemCount: onboardingList.length,
              onPageChanged: (int page) {
                setState(() {
                  selectedIndex = page;
                });
              },
              itemBuilder: (_, index) {
                var data = onboardingList[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Image.asset(
                          data['image'],
                          height: MediaQuery.of(context).size.height / 1,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 68,
                    ),
                    Text(
                      data['title'],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: const Color(0xff0D0F44),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      data['subtitle'],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xff727587),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            alignment: Alignment.topCenter,
            height: (onboardingList.length - 1) == selectedIndex ? 165 : 50,
            child: Column(
              children: [
                // Page indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                const SizedBox(
                  height: 40,
                ),
                //Continue Button
                if ((onboardingList.length - 1) == selectedIndex) ...[
                  FilledButton(
                    onPressed: onContinue,
                    style: ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.black),
                      padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 79, vertical: 21),
                      ),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xff000000),
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Custom UI
  Widget _indicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? const Color(0XFFE77711) : const Color(0XFFDADEEB),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < onboardingList.length; i++) {
      list.add(i == selectedIndex ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  void onContinue() {
    Navigator.pushNamed(context, "Home");
  }
}
