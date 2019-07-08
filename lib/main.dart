import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'pages/landingPage.dart';

void main() {
  runApp(new MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFFEBF1F1),
      fontFamily: 'Roboto',
      textTheme: TextTheme(
        title: TextStyle(
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
          color: const Color(0xFFF1C40F),
        ),
        subhead: TextStyle(
          fontSize: 24.0,
          color: const Color(0xFF67767D),
          fontWeight: FontWeight.bold,
        ),
        caption: TextStyle(
          fontSize: 16.0,
          color: const Color(0xFFCCD2D2),
          fontWeight: FontWeight.bold,
        ),
        body1: TextStyle(
          fontSize: 16.0,
          color: const Color(0xFFFFFFFF),
          fontWeight: FontWeight.w400,
        ),
        body2: TextStyle(
          fontSize: 16.0,
          color: const Color(0xFFF1C40F),
          fontWeight: FontWeight.bold,
        ),
        display1: TextStyle(
          fontSize: 18.0,
          color: const Color(0xFFFFFFFF),
          fontWeight: FontWeight.bold,
        ),
        display2: TextStyle(
          fontSize: 18.0,
          color: const Color(0xFFA3ABAE),
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    debugShowCheckedModeBanner: false,
    home:  LandingPage(),
  ));
}
