import 'package:flutter/material.dart';
import 'package:it_hub/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:it_hub/splash.dart';

class QuizPage extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    return MaterialApp( debugShowCheckedModeBanner: false,
      title: "QuizApp",
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Splashscreen(),
    );
  }
}
