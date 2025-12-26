import 'package:model/model.dart';
import 'package:view_model/base/base_details_view_model_impl.dart';
import 'package:view_model/web_sites/web_site_details_view_model.dart';
import 'package:view_model/web_sites/web_site_ui_model.dart';
import 'package:view_model/years/year_details_view_model.dart';
import 'package:view_model/years/year_ui_model.dart';

class WebSiteDetailsViewModelImpl extends BaseDetailsViewModelImpl<WebSiteUIModel> implements WebSiteDetailsViewModel {
  final WebSiteService service;

  WebSiteDetailsViewModelImpl({required super.inject}) : service = inject();

  @override
  Future<WebSiteUIModel?> loadItemDetails(String webSiteId) async {
    try {
      var website = await service.loadWebsite(webSiteId);
      if (website == null) return null;
      return WebSiteUIModel.fromModel(website);
    } catch (e) {
      return null;
    }
  }
}