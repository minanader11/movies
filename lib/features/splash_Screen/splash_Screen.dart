import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies/features/main_page.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splash_Screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3), // Change the duration as needed
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
             Image.asset(
                'assets/images/splash.png',
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
              )
           );
  }
}
