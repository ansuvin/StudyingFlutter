import 'package:flutter/material.dart';
import 'package:flutter_app/screans/logout.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController idController;
  TextEditingController passController;
  String userInfo = "";

  static final storage = new FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    passController = TextEditingController();

    // 비동기로 flutter secure storage 정보를 불러오기
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    userInfo = await storage.read(key: "login");
    print(userInfo);

    if (userInfo != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LogOutPage(
                      id: userInfo.split(" ")[1],
                      pass: userInfo.split(" ")[3])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginPage"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: "id"),
            ),
            TextField(
              controller: passController,
              decoration: InputDecoration(labelText: "password"),
            ),
            RaisedButton(onPressed: () async {
              await storage.write(key: "login",
                  value: "id " + idController.text.toString() + " " +
                      "password " + passController.text.toString());

              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) =>
                      LogOutPage(
                        id: idController.text, pass: passController.text,)));
            },
              child: Text("로그인"),)
          ],
        ),
      ),
    );
  }
}
