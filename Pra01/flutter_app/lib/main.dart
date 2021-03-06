import 'package:flutter/material.dart';
import 'package:flutter_app/ScreenA.dart';
import 'package:flutter_app/ScreenB.dart';
import 'package:flutter_app/ScreenC.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Appbar",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: "/",
      routes: {
        "/" : (context) => ScreenA(),
        "/b" : (context) => ScreenB(),
        "/c" : (context) => ScreenC(),
      },
    );
  }
}