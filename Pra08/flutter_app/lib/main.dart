import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Google map",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  
  void getCoordinate() async {
    List<Location> locations = await locationFromAddress("광주광역시 운남삼성아파트");
    print("locations: ${locations[0].latitude}, ${locations[0].longitude}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter KaKaoMap example")),
      body: Center(
        child: RaisedButton(
          child: Text("눌러라"),
          onPressed: getCoordinate,
        ),
      )
    );
  }
}
