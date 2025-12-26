import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:model/injectable.dart';
import 'package:model/session/session_service.dart';
import 'package:model/web_sites/api/web_site_rest.dart';
import 'package:model/web_sites/web_site_model.dart';
import 'package:model/web_sites/web_site_service.dart';

class WebSiteServiceImpl extends Injectable implements WebSiteService {
  final SessionService sessionService;
  late WebSiteRest client;

  WebSiteServiceImpl(super.inject) : sessionService = inject() {
    Dio dio = Dio(BaseOptions(preserveHeaderCase: true));
    dio.interceptors.add(
      AwesomeDioInterceptor(logRequestTimeout: false, logResponseHeaders: false, logger: debugPrint),
    );
    client = WebSiteRest(dio);
  }

  @override
  Future<List<WebSiteModel>> loadWebsites() async {
    var token = sessionService.bearerToken();
    if (token == null) return [];
    var webSites = await client.list(token);
    return webSites.map((e) => WebSiteModel.fromApi(e)).toList();
  }

  @override
  Future<WebSiteModel?> loadWebsite(String webSiteId) async {
    var token = sessionService.bearerToken();
    if (token == null) return null;
    var year = await client.details(token, webSiteId);
    return WebSiteModel.fromApi(year);
  }

  @override
  Future<String?> createWebsite(String newWebSiteName, String newWebSiteUrl) async {
    var token = sessionService.bearerToken();
    if (token == null) return null;
    var website = await client.insert(token, {"name": newWebSiteName, "url": newWebSiteUrl});
    return WebSiteModel.fromApi(website).id;
  }

  @override
  Future<void> deleteWebsite(String id) async {
    var token = sessionService.bearerToken();
    if (token == null) return;
    await client.delete(token, id);
  }
}
