import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:model/cities/api/city_rest.dart';
import 'package:model/cities/city_model.dart';
import 'package:model/cities/city_service.dart';
import 'package:model/injectable.dart';
import 'package:model/session/session_service.dart';
import 'package:model/web_sites/api/web_site_rest.dart';
import 'package:model/web_sites/web_site_model.dart';
import 'package:model/web_sites/web_site_service.dart';

class CityServiceImpl extends Injectable implements CityService {
  final SessionService sessionService;
  late CityRest client;

  CityServiceImpl(super.inject) : sessionService = inject() {
    Dio dio = Dio(BaseOptions(preserveHeaderCase: true));
    dio.interceptors.add(
      AwesomeDioInterceptor(logRequestTimeout: false, logResponseHeaders: false, logger: debugPrint),
    );
    client = CityRest(dio);
  }

  @override
  Future<List<CityModel>> loadCities() async {
    var token = sessionService.bearerToken();
    if (token == null) return [];
    var cities = await client.list(token);
    return cities.map((e) => CityModel.fromApi(e)).toList();
  }

  @override
  Future<CityModel?> loadCity(String cityId) async {
    var token = sessionService.bearerToken();
    if (token == null) return null;
    var city = await client.details(token, cityId);
    return CityModel.fromApi(city);
  }

  @override
  Future<String?> createCity(String cityName, String cityCode) async {
    var token = sessionService.bearerToken();
    if (token == null) return null;
    var city = await client.insert(token, {"name": cityName , "code": cityCode});
    return CityModel.fromApi(city).id;
  }

  @override
  Future<void> deleteCity(String id) async {
    var token = sessionService.bearerToken();
    if (token == null) return;
    await client.delete(token, id);
  }
}
