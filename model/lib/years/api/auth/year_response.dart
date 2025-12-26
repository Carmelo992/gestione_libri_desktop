import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'year_response.g.dart';

@JsonSerializable()
class YearResponse {
  @Field("id")
  final int id;
  @Field("name")
  final String name;

  factory YearResponse.fromJson(Map<String, dynamic> json) => _$YearResponseFromJson(json);

  YearResponse({required this.id, required this.name});

  Map<String, dynamic> toJson() => _$YearResponseToJson(this);
}
