import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/retrofit/RestClient.dart';
import 'package:flutter_app/widgets/app_bar.dart';


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
      final resp = await client.postCourse({"name":"안녕"});

      print("post: ${resp.toJson()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("title"),
      body: Center(
        child: Column(
          children: [
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
