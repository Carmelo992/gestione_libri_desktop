import 'package:model/cities/api/city_response.dart';

class CityModel {
  final String id;
  final String name;
  final String code;

  CityModel.fromApi(CityResponse model) : id = model.id.toString(), name = model.name, code = model.code;
}
