import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequestModel {
  @Field("email")
  String email;
  @Field("password")
  String password;

  LoginRequestModel({required this.email, required this.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) => _$LoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
