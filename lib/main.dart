import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter04/screen/contact/contactScreen.dart';
import 'package:flutter04/screen/homeScreen.dart';
import 'package:flutter04/screen/resumeSelectScreen.dart';
import 'package:flutter04/screen/spleshScreen.dart';
import 'package:flutter04/screen/stickerEdit/editImage.dart';



StreamController streamController= StreamController();

void main() {

  var darkTheme = ThemeData(
      textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
      appBarTheme: AppBarTheme(color: Colors.orange, centerTitle: true),
      brightness: Brightness.dark);

  var lightTheme = ThemeData(
      textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
      appBarTheme: AppBarTheme(color: Colors.orange, centerTitle: true),
      brightness: Brightness.light);

  runApp(
    StreamBuilder(
      initialData: false,
      stream: streamController.stream,
      builder: (context, data) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          theme: data.data as bool ? darkTheme : lightTheme,
          routes: {
            '/': (context) => EditImage(),
            'selectResume': (context) => ResumeSelectScreen(),
            'contact': (context) => ContactScreen(),
            'splesh': (context) => SpleshScreen(),
          },
        );
      },
    ),
  );
}
