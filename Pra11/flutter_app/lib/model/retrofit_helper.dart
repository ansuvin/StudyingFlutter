import 'package:dio/dio.dart';
import 'package:flutter_app/model/post_vo.dart';
import 'package:retrofit/http.dart';

part 'retrofit_helper.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class RetrofitHelper {
  factory RetrofitHelper(Dio dio, {String baseUrl}) = _RetrofitHelper;

  @GET("/posts")
  Future<List<PostVO>> getPosts();
}