import 'package:flutter/material.dart';
import 'file:///D:/StudyingFlutter/Pra09/flutter_app/lib/screans/maps/current_position.dart';
import 'screans/maps/google_office.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pra 09",
      home: CurrentPosition(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google maps"),
      ),
      body: Container()
    );
  }


}

