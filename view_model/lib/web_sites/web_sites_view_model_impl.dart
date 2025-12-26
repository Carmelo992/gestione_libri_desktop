import 'package:model/model.dart';
import 'package:view_model/base/base_list_view_model_impl.dart';
import 'package:view_model/web_sites/web_site_ui_model.dart';
import 'package:view_model/web_sites/web_sites_view_model.dart';

class WebSitesViewModelImpl extends BaseListViewModelImpl<WebSiteUIModel> implements WebSitesViewModel {
  final WebSiteService service;

  WebSitesViewModelImpl({required super.inject}) : service = inject();

  @override
  Future<List<WebSiteUIModel>> loadItems() {
    return service.loadWebsites().then((years) {
      return years.map((website) => WebSiteUIModel.fromModel(website)).toList();
    });
  }

  @override
  Future<String?> createNewWebSite(String newWebSiteName, String newWebSiteUrl) async {
    isLoading.value = true;
    String? websiteId;
    try {
      websiteId = await service.createWebsite(newWebSiteName, newWebSiteUrl);
      await refreshItems();
      return websiteId;
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
    return websiteId;
  }

  @override
  void deleteWebSite(String id) async {
    isLoading.value = true;
    try {
      await service.deleteWebsite(id);
      await refreshItems();
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }
}
