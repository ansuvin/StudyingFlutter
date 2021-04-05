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

  @GET("/api/todos")
  Future<List<Todo>> getTodos();

  @POST("/api/todos")
  Future<Todo> postTodo(
      @Body() Map<String, dynamic> body
      );

  @PUT("/api/todos/{id}/isComplete")
  Future<Todo> putTodo(
      @Path("id") int id,
      @Body() Map<String, dynamic> body
      );

  @DELETE("/api/todos/{id}")
  Future<Todo> deleteTodo(
      @Path("id") int id
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

@JsonSerializable()
class Todo {
  String title;
  int id;
  bool isComplete;

  Todo({this.title, this.id, this.isComplete});

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}