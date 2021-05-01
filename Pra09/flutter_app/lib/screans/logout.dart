import 'package:flutter/material.dart';
import 'package:flutter_app/screans/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LogOutPage extends StatefulWidget {
  String id;
  String pass;

  LogOutPage({this.id, this.pass});

  @override
  _LogOutPageState createState() => _LogOutPageState();
}

class _LogOutPageState extends State<LogOutPage> {
  static final storage = FlutterSecureStorage();

  String id;
  String pass;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    pass = widget.pass;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logout Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("id: ${id}"),
            Text("password: ${pass}"),
            RaisedButton(
              onPressed: () {
                print("hi");
                storage.delete(key: "login");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
