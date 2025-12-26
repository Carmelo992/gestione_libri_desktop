import 'package:model/model.dart';

class WebSiteUIModel {
  final String id;
  final String name;
  final String url;

  WebSiteUIModel.fromModel(WebSiteModel website) : id = website.id, name = website.name, url = website.url;
}
