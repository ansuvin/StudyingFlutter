import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_app/data/my_location.dart';
import 'package:flutter_app/data/network.dart';
import 'package:flutter_app/screens/weather_screen.dart';

const apikey = "3b28825fd5bbad49ff82584b36b566b3";

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  double longitude;
  double latitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude = myLocation.latitude;
    longitude = myLocation.longitude;
    print("$latitude $longitude");

    Network network = Network("jsonplaceholder.typicode.com", "/posts");

    var data = await network.getJsonData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return WeatherScreen(parseData: data);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: '메뉴3'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: '메뉴'),
          BottomNavigationBarItem(icon: Icon(Icons.error), label: '메뉴2')
        ],
      ),
      body: Center(
        child: RaisedButton(
          onPressed: null,
          child: Text("Get my location",
          style: TextStyle(
            color: Colors.white,
          ),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }
}
