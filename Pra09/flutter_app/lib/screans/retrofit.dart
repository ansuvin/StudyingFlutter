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

  getCourse() {
    Future.microtask(() async {
      final resp = await client.getCourses();

      print("resp: ${resp[2].name}");
    });
  }

  postCourse() {
    Future.microtask(() async {
      final resp = await client.postCourse({"name":controller.text});

      print("post: ${resp.toJson()}");
    });
  }

  putCourse() {
    Future.microtask(() async {
      final resp = await client.putCourse(2, {"name": controller.text});

      print("put: ${resp.toJson()}");
    });
  }

  Future<List<Todo>> getTodos() async {
    await Future.microtask(() async {
      final resp = await client.getTodos();

      print("getTodos");
      for (int i=0; i<resp.length; i++) {
        print("${resp[i].toJson()}");
      }

      return resp.toList();
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
              getTodos();
            }),
            SizedBox(height: 10,),
            Expanded(
              child: FutureBuilder(
                future: client.getTodos(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print("호잇: ${snapshot.data}");
                  if (snapshot.hasData) {
                    List<Todo> data = snapshot.data;
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (_, int index) {
                          return Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              margin: EdgeInsets.all(10),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Text("${data[index].id}. ${data[index].title}"),
                                  trailing: data[index].isComplete
                                      ? Icon(Icons.check_circle)
                                      : Icon(Icons.highlight_remove),
                                ),
                              )
                          );
                        });
                  }
                  else {
                    return Center(child: CircularProgressIndicator());
                  }
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
