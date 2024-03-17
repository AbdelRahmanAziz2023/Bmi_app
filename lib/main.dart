import 'package:bmi/ResultPage.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Colors.black,
        ),
        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
        iconTheme:  IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          headline3: TextStyle(
              color: Colors.grey, fontSize: 25, fontWeight: FontWeight.bold),
          headline4: TextStyle(
              color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
          headline5: TextStyle(
              color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold,),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
