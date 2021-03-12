import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseData});
  final parseData;
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  String title;
  int id;

  @override
  void initState() {
    super.initState();
    updateData(widget.parseData);
  }

  void updateData(dynamic data) {
    print("호 $data");
    var jsonData = data[1];
    title = jsonData['title'];
    id = jsonData['id'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$title',
                style: TextStyle(
                  fontSize: 30
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '$id',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
