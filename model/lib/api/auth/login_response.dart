import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @Field("id")
  final int id;
  @Field("firstName")
  final String firstName;
  @Field("lastName")
  final String lastName;
  @Field("email")
  final String email;
  @Field("isAdmin")
  final int isAdmin;
  @Field("createdAt")
  final DateTime createdAt;
  @Field("updatedAt")
  final DateTime updatedAt;
  @Field("token")
  final String token;
  @Field("refreshToken")
  final String refreshToken;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  LoginResponse({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isAdmin,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
    required this.refreshToken,
  });

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
