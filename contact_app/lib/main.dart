import 'package:contact_app/screens/Intro_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      IntroScreen.routeName: (context) => IntroScreen(),
    },
    home: IntroScreen(),));
}
