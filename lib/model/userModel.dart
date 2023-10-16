import 'package:json_annotation/json_annotation.dart';

part 'userModel.g.dart';

@JsonSerializable()
class UserModel {
  @JsonValue("id")
  int? id;

  @JsonValue("email")
  String? email;

  @JsonValue("first_name")
    String? first_name;

  @JsonValue("ast_name")
    String? last_name;

  @JsonValue("avata")
  String? avata;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  }