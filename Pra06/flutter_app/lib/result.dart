import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  final double height ;
  final double weight;

  BmiResult(this.height, this.weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("비만도 계산기"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("정상",
            style: TextStyle(
              fontSize: 36,
            ),),
            SizedBox(
              height: 16,
            ),
            Icon(
              Icons.sentiment_satisfied,
              color: Colors.green,
              size: 100,
            )
          ],
        ),
      ),
    );
  }
}
