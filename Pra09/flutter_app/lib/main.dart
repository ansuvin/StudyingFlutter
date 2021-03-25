import 'package:flutter/material.dart';
import 'screans/design/custom_dialog.dart';
import 'widgets/app_bar.dart';
import 'widgets/drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pra 09",
      home: MyHomePage(),
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
        drawer: buildDrawer(),
        appBar: buildAppBar("custom Appbar"),
        body: Center(
          child: RaisedButton(
            child: Text("show Dialog"),
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => CustomDialog(
                        msg: "이것은 메세지",
                        description: "이것은 설명",
                        buttonText: "이것은 버튼",
                      ));
            },
          ),
        ));
  }
}