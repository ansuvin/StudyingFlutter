import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: "https://2db48182bb6f.ngrok.io")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/api/courses")
  Future<List<Course>> getCourses();

  @GET("/")
  Future<String> getHello();

  @POST("/api/courses")
  Future<Course> postCourse(
      @Body() Map<String, dynamic> body);

  @PUT("/api/courses/{id}")
  Future<Course> putCourse(
      @Path("id") int id,
      @Body() Map<String, dynamic> body
      );

}

@JsonSerializable()
class Course {
  String name;
  int id;

  Course({this.name, this.id});

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}