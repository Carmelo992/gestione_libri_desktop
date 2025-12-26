import 'package:model/web_sites/api/web_site_response.dart';

class WebSiteModel {
  final String id;
  final String name;
  final String url;

  WebSiteModel.fromApi(WebSiteResponse model) : id = model.id.toString(), name = model.name, url = model.url;
}
