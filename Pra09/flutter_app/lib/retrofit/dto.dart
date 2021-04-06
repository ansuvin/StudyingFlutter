import 'package:json_annotation/json_annotation.dart';

part 'dto.g.dart';

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
class ResponseData {
  int code;
  String msg;
  bool success;


  ResponseData({this.code, this.msg, this.success});

  factory ResponseData.fromJson(Map<String, dynamic> json) => _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
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