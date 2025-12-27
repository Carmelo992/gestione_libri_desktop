import 'package:dio/dio.dart' hide Headers;
import 'package:model/cities/api/city_response.dart';
import 'package:retrofit/retrofit.dart';

part 'city_rest.g.dart';

@RestApi(baseUrl: "http://localhost:51006")
abstract interface class CityRest {
  factory CityRest(Dio dio, {String baseUrl}) = _CityRest;

  static const String apiRoute = "/web/cities";

  @GET(apiRoute)
  Future<List<CityResponse>> list(@Header("Authorization") String token);

  @GET("$apiRoute/{id}")
  Future<CityResponse> details(@Header("Authorization") String token, @Path("id") String cityId);

  @POST(apiRoute)
  Future<CityResponse> insert(@Header("Authorization") String token, @Body() Map<String, dynamic> body);

  @DELETE("$apiRoute/{id}")
  Future<void> delete(@Header("Authorization") String token, @Path("id") String cityId);
}
