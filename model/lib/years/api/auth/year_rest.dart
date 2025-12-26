import 'package:dio/dio.dart' hide Headers;
import 'package:model/years/api/auth/year_response.dart';
import 'package:retrofit/retrofit.dart';

part 'year_rest.g.dart';

@RestApi(baseUrl: "http://localhost:51006")
abstract interface class YearRest {
  factory YearRest(Dio dio, {String baseUrl}) = _YearRest;

  @GET("/web/years")
  Future<List<YearResponse>> list(@Header("Authorization") String token);

  @GET("/web/years/{id}")
  Future<YearResponse> details(@Header("Authorization") String token, @Path("id") String yearId);

  @POST("/web/years")
  Future<YearResponse> insert(@Header("Authorization") String token, @Body() Map<String, dynamic> body);

  @DELETE("/web/years/{id}")
  Future<void> delete(@Header("Authorization") String token, @Path("id") String yearId);
}
