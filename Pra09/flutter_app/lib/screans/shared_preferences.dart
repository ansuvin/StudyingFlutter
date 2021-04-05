import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExSharedPreferences extends StatefulWidget {
  @override
  _ExSharedPreferencesState createState() => _ExSharedPreferencesState();
}

class _ExSharedPreferencesState extends State<ExSharedPreferences> {
  int counter=0;
  int num=0;

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = (prefs.getInt('counter') ?? 0) + 1;
      print('Pressed $counter times.');
      print("hihi $num");
      num +=1;
    });
    await prefs.setInt('counter', counter);
  }

  _readcount() async {
    final prefs = await SharedPreferences.getInstance();

    counter = prefs.getInt('counter') ?? 0;

    print(counter);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("shared_preferences"),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: RaisedButton(
                  onPressed: _incrementCounter,
                  child: Text("Increment Counter"),
                ),
              ),
              Expanded(child: Text(
                  counter.toString()
              )),
              Expanded(child: Text(
                  num.toString()
              )),
              Expanded(child: RaisedButton(
                onPressed: _readcount,
                child: Text("readCount"),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
