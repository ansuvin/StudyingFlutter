import 'package:flutter/material.dart';
import 'package:flutter_app/screans/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';

class LogOutPage extends StatefulWidget {
  String id;
  String pass;
  String keyStr;

  LogOutPage({this.id, this.pass, this.keyStr});

  @override
  _LogOutPageState createState() => _LogOutPageState();
}

class _LogOutPageState extends State<LogOutPage> {
  static final storage = FlutterSecureStorage();
  final cryptor = PlatformStringCryptor();

  var flag = true;

  String id;
  String pass;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    pass = widget.pass;
  }

  // flag == true
  decrypted() async {
    try {
      final String decrypted =
          await cryptor.decrypt(widget.pass, widget.keyStr);
      print("decrypted: $decrypted");
      setState(() {
        pass = decrypted;
        flag = !flag;
      });
    } catch (e) {
      print("error: $e");
    }
  }

  // flag == false
  encrypted() async {
    final String encrypted = await cryptor.encrypt(widget.pass, widget.keyStr);
    setState(() {
      pass = encrypted;
      flag = !flag;
    });
    print("encrypted: $encrypted");
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
            ),
            RaisedButton(
              onPressed: flag ? decrypted : encrypted,
              child: Text(flag ? "복호화" : "암호화"),
            )
          ],
        ),
      ),
    );
  }
}
