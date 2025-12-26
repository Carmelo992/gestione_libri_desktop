import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:model/injectable.dart';
import 'package:model/session/session_service.dart';
import 'package:model/years/api/auth/year_rest.dart';
import 'package:model/years/year_model.dart';
import 'package:model/years/year_service.dart';

class YearServiceImpl extends Injectable implements YearService {
  final SessionService sessionService;
  late YearRest client;

  YearServiceImpl(super.inject) : sessionService = inject() {
    Dio dio = Dio(BaseOptions(preserveHeaderCase: true));
    dio.interceptors.add(
      AwesomeDioInterceptor(logRequestTimeout: false, logResponseHeaders: false, logger: debugPrint),
    );
    client = YearRest(dio);
  }

  @override
  Future<List<YearModel>> loadYears() async {
    var token = sessionService.bearerToken();
    if (token == null) return [];
    var years = await client.list(token);
    return years.map((e) => YearModel.fromApi(e)).toList();
  }

  @override
  Future<YearModel?> loadYear(String yearId) async {
    var token = sessionService.bearerToken();
    if (token == null) return null;
    var year = await client.details(token, yearId);
    return YearModel.fromApi(year);
  }

  @override
  Future<String?> createYear(String newYearName) async {
    var token = sessionService.bearerToken();
    if (token == null) return null;
    var year = await client.insert(token, {"name": newYearName});
    return YearModel.fromApi(year).id;
  }

  @override
  Future<void> deleteYear(String id) async {
    var token = sessionService.bearerToken();
    if (token == null) return;
    await client.delete(token, id);
  }
}
