import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLociation();
    fetchData();
  }

  void getLociation() async {
    try {
      Position position = await Geolocator.
      getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position);
    } catch(e) {
      print("인터넷 연결에 문제가 있습니다.");
    }
  }

  void fetchData() async {
    var url = Uri.https("jsonplaceholder.typicode.com", "/posts");
    http.Response response = await http.get(url);
    if(response.statusCode == 200) {
      String jsonData = response.body;
      var myJson = jsonDecode(jsonData)[0]['title'];
      print(myJson);
    }
  }

  final items = List.generate(10,(i) => i).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(
          crossAxisCount: 4,
          children: items.map((e) => Container(
            child: Text("$e"),
            width: 100,
            height: 100,
            color: Colors.blue,
            margin: EdgeInsets.all(16),
          )).toList(),
        )
        // RaisedButton(
        //   onPressed: null,
        //   child: Text("Get my location",
        //   style: TextStyle(
        //     color: Colors.white,
        //   ),
        //   ),
        //   color: Colors.blue,
        // ),
      ),
    );
  }
}
