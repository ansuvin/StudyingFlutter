import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login app",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In",
        style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
                child: RaisedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("images/glogo.png"),
                      Text("Login with Google",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),),
                      Opacity(opacity: 0,
                      child: Image.asset("images/glogo.png"),)
                    ],
                  ),
                  color: Colors.white,
                  onPressed: (){},
                ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ButtonTheme(
              child: RaisedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("images/flogo.png",
                    width: 25,),
                    Text("Login with Facebook",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),),
                    Opacity(opacity: 0,
                      child: Image.asset("images/flogo.png",
                      width: 30,),)
                  ],
                ),
                color: Colors.indigo,
                onPressed: (){},
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ButtonTheme(
              child: RaisedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.email,
                    color: Colors.white,),
                    Text("Login with Email",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),),
                    Opacity(opacity: 0,
                      child: Image.asset("images/glogo.png"),)
                  ],
                ),
                color: Colors.green[700],
                onPressed: (){},
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}


