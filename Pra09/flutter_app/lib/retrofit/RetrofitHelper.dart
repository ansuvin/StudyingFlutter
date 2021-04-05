import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'RetrofitHelper.g.dart';

@RestApi(baseUrl: "http://192.168.137.47:8080/v1")
abstract class RetrofitHelper {
  factory RetrofitHelper(Dio dio, {String baseUrl}) = _RetrofitHelper;

  @POST("/join")
  Future<Response> postJoin(
      @Body() Map<String, dynamic> body
      );

  @POST("/login")
  Future<ResponseLogin> postLogin(
      @Body() Map<String, dynamic> body
      );
}

@JsonSerializable()
class MemberDTO{
  String memberClassNumber;
  String memberEmail;
  String memberPassword;

  MemberDTO({this.memberClassNumber, this.memberEmail, this.memberPassword});

  factory MemberDTO.fromJson(Map<String, dynamic> json) => _$MemberDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MemberDTOToJson(this);
}

@JsonSerializable()
class Response {
  int code;
  String msg;
  bool success;


  Response({this.code, this.msg, this.success});

  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable()
class MemberLoginDTO{
  String memberEmail;
  String memberPassword;

  MemberLoginDTO({this.memberEmail, this.memberPassword});

  factory MemberLoginDTO.fromJson(Map<String, dynamic> json) => _$MemberLoginDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MemberLoginDTOToJson(this);
}

@JsonSerializable()
class ResponseLogin {
  int code;
  Data data;
  String msg;
  bool success;


  ResponseLogin({this.code, this.data, this.msg, this.success});

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => _$ResponseLoginFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseLoginToJson(this);
}

@JsonSerializable()
class Data {
  String accessToken;
  String memberClassNumber;
  String memberEmail;
  String roles;


  Data({this.accessToken, this.memberClassNumber, this.memberEmail, this.roles});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}