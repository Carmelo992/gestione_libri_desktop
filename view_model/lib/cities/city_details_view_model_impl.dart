import 'package:model/model.dart';
import 'package:view_model/base/base_details_view_model_impl.dart';
import 'package:view_model/cities/city_details_view_model.dart';
import 'package:view_model/cities/city_ui_model.dart';

class CityDetailsViewModelImpl extends BaseDetailsViewModelImpl<CityUIModel> implements CityDetailsViewModel {
  final CityService service;

  CityDetailsViewModelImpl({required super.inject}) : service = inject();

  @override
  Future<CityUIModel?> loadItemDetails(String cityId) async {
    try {
      var city = await service.loadCity(cityId);
      if (city == null) return null;
      return CityUIModel.fromModel(city);
    } catch (e) {
      return null;
    }
  }
}
