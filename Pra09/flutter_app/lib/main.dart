import 'package:flutter/material.dart';
import 'screans/design/custom_dialog.dart';
import 'widgets/app_bar.dart';
import 'widgets/drawer.dart';
import 'widgets/text_field.dart';

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
  TextEditingController _textController1 = TextEditingController();
  TextEditingController _textController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: buildDrawer(),
        appBar: buildAppBar("custom Appbar"),
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                child: Text("show Dialog"),
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) => CustomDialog(
                            msg: "${_textController1.text}",
                            description: "${_textController2.text}",
                            buttonText: "이것은 버튼",
                          ));
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(33,10,33,10),
                child: buildTextField("하잉", _textController1),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(33,10,33,10),
                child: buildTextField("호잇", _textController2),
              ),
              Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.fromLTRB(33,10,10,10),
                    child: buildTextField("하잉2", _textController1),
                  ),),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.fromLTRB(10,10,33,10),
                    child: buildTextField("호잇2", _textController2),
                  ),)
                ],
              )
            ],
          ),
        ));
  }
}