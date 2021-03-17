import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class Todo {
  bool isDone;
  final String title;
  final int userId;

  Todo({this.title, this.isDone = false, this.userId});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      userId: json["id"],
      isDone: json['isDone']
    );
  }
}


Future<dynamic> getJsonData() async {
 // final response = await http.get(Uri.https("ec8391738234.ngrok.io", "/api/read_list"));
  final response = await http.get(Uri.https("jsonplaceholder.typicode.com", "/posts"));

  if(response.statusCode == 200) {
      var parsingData = jsonDecode(response.body);
    return parsingData;
  } else {
    throw Exception("Failed to load Todo");
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To do List",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final _items = <Todo>[];

  var _todoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getList();
  }

  void getList() async {
    var data = await getJsonData();

    for(int i=0; i<10; i++) {
      _items.add(Todo(title: data[i]['title'], isDone: false, userId: data[i]['userId']));
    }
  }

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("남은 할 일"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextField(
                      controller: _todoController,
                    )),
                RaisedButton(child: Text("추가"), onPressed: () => _addTodo(Todo(title: _todoController.text)))
              ],
            ),
            Expanded(child: ListView(
              children: _items.map((todo) => _buildItemWidget(todo)).toList(),
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildItemWidget(Todo todo) {
    return ListTile(
      onTap: () => _toggleTodo(todo),
      title: Text(
        todo.title,
        style: todo.isDone ? TextStyle(decoration: TextDecoration.lineThrough,
            fontStyle: FontStyle.italic) : null
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () => _deleteTodo(todo),
      ),
    );
  }

  void _addTodo(Todo todo) {
    setState(() {
      _items.add(todo);
      _todoController.text = "";
    });
  }

  void _deleteTodo(Todo todo) {
    setState(() {
      _items.remove(todo);
    });
  }

  void _toggleTodo(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }
}
