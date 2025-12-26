import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'web_site_response.g.dart';

@JsonSerializable()
class WebSiteResponse {
  @Field("id")
  final int id;
  @Field("name")
  final String name;
  @Field("url")
  final String url;

  factory WebSiteResponse.fromJson(Map<String, dynamic> json) => _$WebSiteResponseFromJson(json);

  WebSiteResponse({required this.id, required this.name, required this.url});

  Map<String, dynamic> toJson() => _$WebSiteResponseToJson(this);
}
