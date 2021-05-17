import 'package:json_annotation/json_annotation.dart';

part 'post_vo.g.dart';

@JsonSerializable()
class PostVO {
  @JsonKey(name: "userId")
  int userId;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "body")
  String body;

  PostVO({this.userId, this.id, this.title, this.body});

  factory PostVO.fromJson(Map<String, dynamic> json) => _$PostVOFromJson(json);

  Map<String, dynamic> toJson() => _$PostVOToJson(this);
}