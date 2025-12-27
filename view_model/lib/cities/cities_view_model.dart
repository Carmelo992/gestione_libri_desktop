import 'package:view_model/base/base_list_view_model.dart';
import 'package:view_model/cities/city_ui_model.dart';

abstract interface class CitiesViewModel implements BaseListViewModel<CityUIModel> {
  Future<String?> createNewCity(String cityName, String cityCode);

  void deleteCity(String id);
}
