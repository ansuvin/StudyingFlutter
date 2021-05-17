import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/post_vo.dart';
import 'package:flutter_app/model/retrofit_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pagination',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RetrofitHelper helper;
  List<PostVO> postList = [];
  
  @override
  void initState() {
    super.initState();
    initRetrofit();
  }
  
  initRetrofit() {
    Dio dio = Dio(BaseOptions(
        connectTimeout: 5 * 1000,
        receiveTimeout: 5 * 1000,
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        }));
    helper = RetrofitHelper(dio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: _getPosts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              postList = snapshot.data;
              return ListView.builder(itemBuilder: (context, index) {
                return itemPost(context, index);
              });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        )
      ),
    );
  }

  Future<List<PostVO>> _getPosts() async {
    try {
      var res = await helper.getPosts();
      if (res != null) {
        return res.toList();
      } else {
        return null;
      }
    } catch (e) {
      print("error: $e");
    }
  }

  Widget itemPost(BuildContext context, int index) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("작성자: ${postList[index].userId}"),
            Text("제목: ${postList[index].title}"),
            Text("내용: ${postList[index].body}", maxLines: 3, overflow: TextOverflow.ellipsis,)
          ],
        ),
      ),
    );
  }
}
