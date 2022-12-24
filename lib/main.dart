import 'package:facebook_ui_flutter/screens/nav_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'config/palette.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Facebook UI',
      debugShowCheckedModeBanner: false,
      home: const NavScreen(),
      //home: const TestScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Palette.scaffold,
      ),
    ),
  );
}
