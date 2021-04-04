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
      final resp = await client.postCourse({"name": controller.text});

      print("post: ${resp.toJson()}");
    });
  }

  putCourse() {
    Future.microtask(() async {
      final resp = await client.putCourse(2, {"name": controller.text});

      print("put: ${resp.toJson()}");
    });
  }

  getTodos() async {
    await Future.microtask(() async {
      final resp = await client.getTodos();

      for(int i=0;i<resp.length;i++) {
        print(resp[i].toJson());
      }
    });
  }

  updateIsComplete(bool isComplete, int id) {
    Future.microtask(() async {
      await client.putTodo(id+1, {"isComplete": !isComplete});

      print(!isComplete);
    });
    setState(() {
      getTodos();
    });
  }

  postTodo(String title) async {
    await client.postTodo({"title": controller.text});
    setState(() {
      getTodos();
    });
  }

  deleteTodo(int id) async {
    await client.deleteTodo(id);
    setState(() {
      getTodos();
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
            Padding(
              padding: EdgeInsets.all(25),
              child: buildTextField("써라", controller),
            ),
            RaisedButton(
                child: Text("눌러라"),
                onPressed: () {
                  postTodo(controller.text);
                }),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder(
                  future: client.getTodos(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<Todo> data = snapshot.data;
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (_, int index) {
                            return Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                margin: EdgeInsets.all(10),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: IconButton(
                                      icon: Icon(Icons.restore_from_trash),
                                      color: Colors.grey,
                                      onPressed: () {
                                        deleteTodo(data[index].id);
                                      },
                                    ),
                                    title: Text(
                                        "${data[index].id}. ${data[index].title}"),
                                    trailing: data[index].isComplete
                                        ? IconButton(
                                            icon: Icon(
                                              Icons.check_circle,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              updateIsComplete(true, index);
                                            },
                                          )
                                        : IconButton(
                                            icon: Icon(
                                              Icons.highlight_remove_sharp,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              updateIsComplete(false, index);
                                            },
                                          ),
                                  ),
                                ));
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
