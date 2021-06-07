import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  List<String> postList = [];
  final showItemCount = 10;
  int itemCount = 10;
  int cnt = 15;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    initRetrofit();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        await Future.delayed(Duration(seconds: 1));
        setState(() {
          if (itemCount != postList.length) {
            if ((postList.length - itemCount) ~/ showItemCount <= 0) {
              itemCount += postList.length % showItemCount;
            } else {
              itemCount += showItemCount;
            }
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
        body: Column(
          children: [
            RaisedButton(
              onPressed: () {
                postList.add("추가됨 ${postList.length}");
                setState(() {
                  _getPosts();
                  itemCount ++;
                  cnt ++;
                });
                print("itemCount: $itemCount, postList: ${postList.length}");
              },
              child: Text("추가하기"),
            ),
            Expanded(
                child: FutureBuilder(
                    future: _getPosts(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        postList = snapshot.data;
                        if (postList.length <= showItemCount) {
                          itemCount = postList.length;
                        }
                        return ListView.builder(
                            controller: _scrollController,
                            itemCount: itemCount + 1,
                            itemBuilder: (context, index) {
                              print(
                                  "itemCount: $itemCount, index: $index, postList.length: ${postList.length}");
                              if (index == itemCount) {
                                if (index == 0) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    elevation: 5,
                                    margin: EdgeInsets.fromLTRB(25, 13, 25, 13),
                                    child: Center(
                                      child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            "등록된 태그가 없습니다.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700),
                                          )),
                                    ),
                                  );
                                } else if (index == postList.length) {
                                  return Card(
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: RaisedButton(
                                          child: Text("맨 처음으로"),
                                          onPressed: () {
                                            print("처음으로!!");
                                            _scrollController.animateTo(
                                                _scrollController
                                                    .position.minScrollExtent,
                                                duration:
                                                    Duration(milliseconds: 200),
                                                curve: Curves.elasticOut);
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Card(
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15, bottom: 15),
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  );
                                }
                              }
                              return itemPost(context, index);
                            });
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })),
          ],
        ));
  }

  Future<List<String>> _getPosts() async {
    var list = List.generate(cnt, (index) => "하이하이 $index");
    return list;
  }

  Widget itemPost(BuildContext context, int index) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("작성자: ${postList[index]},"),
          ],
        ),
      ),
    );
  }
}
