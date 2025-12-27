import 'package:model/model.dart';
import 'package:view_model/base/base_list_view_model_impl.dart';
import 'package:view_model/cities/cities_view_model.dart';
import 'package:view_model/cities/city_ui_model.dart';

class CitiesViewModelImpl extends BaseListViewModelImpl<CityUIModel> implements CitiesViewModel {
  final CityService service;

  CitiesViewModelImpl({required super.inject}) : service = inject();

  @override
  Future<List<CityUIModel>> loadItems() {
    return service.loadCities().then((cities) {
      return cities.map((city) => CityUIModel.fromModel(city)).toList();
    });
  }

  @override
  Future<String?> createNewCity(String cityName, String cityCode) async {
    isLoading.value = true;
    String? cityId;
    try {
      cityId = await service.createCity(cityName, cityCode);
      await refreshItems();
      return cityId;
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
    return cityId;
  }

  @override
  void deleteCity(String id) async {
    isLoading.value = true;
    try {
      await service.deleteCity(id);
      await refreshItems();
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }
}
