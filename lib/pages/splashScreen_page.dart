import 'dart:async';

import 'package:codelabs_movieapp/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, '/home'));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget bodySplashScreen() {
      return Container(
        height: size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icn_movie.png',
                height: 120,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'My Movie',
                style: splashScreenTextStyle,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      body: bodySplashScreen(),
    );
  }
}
