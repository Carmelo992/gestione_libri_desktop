import 'package:model/web_sites/web_site_model.dart';

abstract interface class WebSiteService {
  Future<List<WebSiteModel>> loadWebsites();

  Future<WebSiteModel?> loadWebsite(String webSiteId);

  Future<String?> createWebsite(String newWebSiteName, String newWebSiteUrl);

  Future<void> deleteWebsite(String id);
}
