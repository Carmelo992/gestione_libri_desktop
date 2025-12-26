import 'package:dio/dio.dart' hide Headers;
import 'package:model/web_sites/api/web_site_response.dart';
import 'package:retrofit/retrofit.dart';

part 'web_site_rest.g.dart';

@RestApi(baseUrl: "http://localhost:51006")
abstract interface class WebSiteRest {
  factory WebSiteRest(Dio dio, {String baseUrl}) = _WebSiteRest;

  @GET("/web/website")
  Future<List<WebSiteResponse>> list(@Header("Authorization") String token);

  @GET("/web/website/{id}")
  Future<WebSiteResponse> details(@Header("Authorization") String token, @Path("id") String webSiteId);

  @POST("/web/website")
  Future<WebSiteResponse> insert(@Header("Authorization") String token, @Body() Map<String, dynamic> body);

  @DELETE("/web/website/{id}")
  Future<void> delete(@Header("Authorization") String token, @Path("id") String webSiteId);
}
