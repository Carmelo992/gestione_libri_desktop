import 'package:model/cities/city_model.dart';

abstract interface class CityService {
  Future<List<CityModel>> loadCities();

  Future<CityModel?> loadCity(String cityId);

  Future<String?> createCity(String cityName, String cityCode);

  Future<void> deleteCity(String id);
}
