import 'package:model/model.dart';
import 'package:view_model/base/base_list_view_model_impl.dart';
import 'package:view_model/years/year_ui_model.dart';
import 'package:view_model/years/years_view_model.dart';

class YearsViewModelImpl extends BaseListViewModelImpl<YearUIModel> implements YearsViewModel {
  final YearService service;

  YearsViewModelImpl({required super.inject}) : service = inject();

  @override
  Future<List<YearUIModel>> loadItems() {
    return service.loadYears().then((years) {
      return years.map((year) => YearUIModel.fromModel(year)).toList();
    });
  }

  @override
  Future<String?> createNewYear(String newYear) async {
    isLoading.value = true;
    String? yearId;
    try {
      yearId = await service.createYear(newYear);
      await refreshItems();
      return yearId;
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
    return yearId;
  }

  @override
  void deleteYear(String id) async {
    isLoading.value = true;
    try {
      await service.deleteYear(id);
      await refreshItems();
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }
}
