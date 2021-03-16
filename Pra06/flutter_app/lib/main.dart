import 'package:flutter/material.dart';
import 'package:flutter_app/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Retrieve Text Input',
      home: BmiMain(),
    );
  }
}

class BmiMain extends StatefulWidget {
  @override
  _BmiMainState createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {
  final _formKey = GlobalKey<FormState>();

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비만도 계산기'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _heightController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "키"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.trim().isEmpty) {
                    // 입력한 값의 앞뒤 공백을 제거한 것이 비었다면 에러표시
                    return "키를 입력하세요";
                  }
                  return null; // null을 반환하면 에러 없음
                },
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _weightController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '몸무게',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return "몸무게를 입력하세요.";
                  }
                  return null;
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  onPressed: () {
                    // 폼에 입력된 값 검증 (하나라도 false면 밑에 에러 표시)
                    if (_formKey.currentState.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BmiResult(
                                  double.parse(_heightController.text.trim()),
                                  double.parse(
                                      _weightController.text.trim()))));
                    }
                  },
                  child: Text("결과"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
