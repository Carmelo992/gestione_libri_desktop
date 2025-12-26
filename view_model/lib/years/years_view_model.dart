import 'package:view_model/base/base_list_view_model.dart';
import 'package:view_model/years/year_ui_model.dart';

abstract interface class YearsViewModel implements BaseListViewModel<YearUIModel> {
  Future<String?> createNewYear(String newYear);

  void deleteYear(String id);
}
