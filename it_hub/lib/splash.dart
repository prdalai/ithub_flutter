import 'dart:async';

import 'package:flutter/material.dart';

import 'home.dart';
class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 1), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => homepage(),
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "QuizTime",
          style: TextStyle(
            color: Colors.cyan,
            fontSize: 50.0,
            fontFamily: "Satisfy"
          ),
        ),
      ),
    );
  }
}
