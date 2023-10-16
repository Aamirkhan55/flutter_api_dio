import 'package:flutter_api_dio/model/userModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'singleUser.g.dart';

 @JsonSerializable()
class SingleUserResponse {
SingleUserResponse();

 @JsonKey(name: "data")
 late UserModel user;

  factory SingleUserResponse.fromJson(Map<String, dynamic> json) => _$SingleUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SingleUserResponseToJson(this);
}