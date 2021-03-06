import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context2) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First page"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Co to the Second page"),
          onPressed: (){
            Navigator.push(context2, MaterialPageRoute(
                builder: (context) => SecondPage()
            ));
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second page"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Co to the First page"),
          onPressed: (){
            Navigator.pop(ctx);
          },
        ),
      ),
    );
  }
}
