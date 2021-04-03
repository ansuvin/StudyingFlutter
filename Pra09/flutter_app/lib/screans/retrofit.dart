import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/retrofit/RestClient.dart';
import 'package:flutter_app/widgets/app_bar.dart';
import 'package:flutter_app/widgets/text_field.dart';


class RetrofitScreen extends StatefulWidget {
  @override
  _RetrofitScreenState createState() => _RetrofitScreenState();
}

class _RetrofitScreenState extends State<RetrofitScreen> {
  RestClient client;

  @override
  void initState() {
    super.initState();

    Dio dio = Dio();

    client = RestClient(dio);
  }

  getRetrofit() {
    Future.microtask(() async {
      final resp = await client.getCourses();

      print("resp: ${resp[2].name}");
    });
  }

  postRetrofit() {
    Future.microtask(() async {
      final resp = await client.postCourse({"name":controller.text});

      print("post: ${resp.toJson()}");
    });
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("title"),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(25),
              child: buildTextField("써라", controller),
            ),
            RaisedButton(
              child: Text("눌러라"),
                onPressed: () {
              getRetrofit();
              postRetrofit();
            }),
          ],
        ),
      ),
    );
  }
}
