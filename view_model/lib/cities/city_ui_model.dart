import 'package:model/model.dart';

class CityUIModel {
  final String id;
  final String name;
  final String code;

  CityUIModel.fromModel(CityModel city) : id = city.id, name = city.name, code = city.code;
}
