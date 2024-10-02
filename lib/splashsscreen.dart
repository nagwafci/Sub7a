import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sub7a/colors.dart';
import 'package:sub7a/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Center(
            child: Text(
              "تسبيح",
              style: TextStyle(
                fontSize: 100,
                color: kred,
                fontWeight: FontWeight.w500,
                fontFamily: "arb",
              ),
            ),
          )),
    );
  }
}
