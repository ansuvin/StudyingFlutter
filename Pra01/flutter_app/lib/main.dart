import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Appbar",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$count"),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(onPressed: () {
                    setState(() {
                      count--;
                      print(count);
                    });
                  },
                  child: Icon(Icons.remove),),
                  SizedBox(width: 30,),
                  FloatingActionButton(onPressed: () {
                    setState(() {
                      count++;
                      print(count);
                    });
                  },
                  child: Icon(Icons.add),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}