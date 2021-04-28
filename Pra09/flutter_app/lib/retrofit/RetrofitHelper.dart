import 'package:dio/dio.dart';
import 'package:flutter_app/retrofit/comment_dto.dart';
import 'package:flutter_app/retrofit/dto.dart';
import 'package:retrofit/retrofit.dart';

part 'RetrofitHelper.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class RetrofitHelper {
  factory RetrofitHelper(Dio dio, {String baseUrl}) = _RetrofitHelper;

  @POST("/join")
  Future<ResponseData> postJoin(@Body() Map<String, dynamic> body);

  @POST("/login")
  Future<ResponseLogin> postLogin(@Body() Map<String, dynamic> body);

  @GET("/comments")
  Future<List<CommentDTO>> getComment(@Query("postId") int postId);
}
