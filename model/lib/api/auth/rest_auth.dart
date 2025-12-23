import 'package:dio/dio.dart' hide Headers;
import 'package:model/api/auth/login_request.dart';
import 'package:model/api/auth/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_auth.g.dart';

@RestApi(baseUrl: "http://localhost:51006")
abstract interface class RestAuth {
  factory RestAuth(Dio dio, {String baseUrl}) = _RestAuth;

  @POST("/auth/login")
  @Headers({"X-APP-WEB": true})
  Future<LoginResponse> login(@Body() LoginRequestModel model);

  @POST("/auth/logout")
  Future<void> logout(@Header("Authorization") String token);
}
