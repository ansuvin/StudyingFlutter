import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/my_button/my_button.dart';

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
      body: _buildButton(),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyButton(
            image: Image.asset("images/glogo.png"),
            text: Text("Login with Google"),
            color: Colors.white,
            radius: 4,
            onPressed: () {},
          ),
          SizedBox(
            height: 10,
          ),
          MyButton(
            image: Image.asset("images/flogo.png"),
            text: Text("Login with Facebook",
            style: TextStyle(color: Colors.white),),
            color: Colors.indigo[900],
            radius: 8,
            onPressed: (){},
          ),
          SizedBox(
            height: 10,
          ),
          MyButton(
            image: Image.asset("images/flogo.png"),
            text: Text("Login with Email",
            style: TextStyle(color: Colors.white),),
            color: Colors.green[800],
            radius: 10,
            onPressed: (){},
          )
        ],
      ),
    );
  }
}
