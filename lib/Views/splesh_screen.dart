import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, 'Intro');
      },
    );
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Image.network(
          "https://w0.peakpx.com/wallpaper/733/1003/HD-wallpaper-jai-shree-krishna-krishna-piyush-thumbnail.jpg",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
