import 'package:flutter/material.dart';
import 'package:flutter_assignment/views/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Varela'
      ),
      title: 'Flutter Assignment',
      home: SplashScreen(),
    );
  }
}