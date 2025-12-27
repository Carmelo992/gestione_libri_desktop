import 'package:dio/dio.dart' hide Headers;
import 'package:model/cities/api/city_response.dart';
import 'package:retrofit/retrofit.dart';

part 'city_rest.g.dart';

@RestApi(baseUrl: "http://localhost:51006")
abstract interface class CityRest {
  factory CityRest(Dio dio, {String baseUrl}) = _CityRest;

  @GET("/web/city")
  Future<List<CityResponse>> list(@Header("Authorization") String token);

  @GET("/web/city/{id}")
  Future<CityResponse> details(@Header("Authorization") String token, @Path("id") String cityId);

  @POST("/web/city")
  Future<CityResponse> insert(@Header("Authorization") String token, @Body() Map<String, dynamic> body);

  @DELETE("/web/city/{id}")
  Future<void> delete(@Header("Authorization") String token, @Path("id") String cityId);
}
