import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: "https://c0b11cb68020.ngrok.io")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/api/courses")
  Future<List<Course>> getCourses();

  @GET("/")
  Future<String> getHello();

}

@JsonSerializable()
class Course {
  String name;
  int id;

  Course({this.name, this.id});

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}