import 'package:json_annotation/json_annotation.dart';

part 'comment_dto.g.dart';

@JsonSerializable()
class CommentDTO{
  @JsonKey(name: 'postId')
  int postId;
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'body')
  String body;

  factory CommentDTO.fromJson(Map<String, dynamic> json) => _$CommentDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CommentDTOToJson(this);

  CommentDTO({this.postId, this.id, this.name, this.email, this.body});
}