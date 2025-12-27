import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'city_response.g.dart';

@JsonSerializable()
class CityResponse {
  @Field("id")
  final int id;
  @Field("name")
  final String name;
  @Field("code")
  final String code;

  factory CityResponse.fromJson(Map<String, dynamic> json) => _$CityResponseFromJson(json);

  CityResponse({required this.id, required this.name, required this.code});

  Map<String, dynamic> toJson() => _$CityResponseToJson(this);
}
