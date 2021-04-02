import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/retrofit/rest_client.dart';

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

    Future.microtask(() async {
      final resp = await client.getTopNews();
    });
  }

  renderNewsCard({@required News news}) {
    return Card(
      child: Column(
        children: [
          Text(news.id.toString()),
          Text(news.title),
          Text(news.url)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: client.getTopNews(),
        initialData: [],
        builder: (_, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      final List<int> ids = snapshot.data;

      return ListView.builder(
        itemCount: ids.length,
        itemBuilder: ( _, index) {
        return FutureBuilder(
          future: client.getNewsDetail(id: ids[index]),
          builder: ( _, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return renderNewsCard(news: snapshot.data);
          },

        );
      },);
    });
  }
}
