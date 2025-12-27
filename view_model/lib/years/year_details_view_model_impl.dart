import 'package:model/model.dart';
import 'package:view_model/base/base_details_view_model_impl.dart';
import 'package:view_model/years/year_details_view_model.dart';
import 'package:view_model/years/year_ui_model.dart';

class YearDetailsViewModelImpl extends BaseDetailsViewModelImpl<YearUIModel> implements YearDetailsViewModel {
  final YearService service;

  YearDetailsViewModelImpl({required super.inject}) : service = inject();

  @override
  Future<YearUIModel?> loadItemDetails(String cityId) async {
    try {
      var year = await service.loadYear(cityId);
      if (year == null) return null;
      return YearUIModel.fromModel(year);
    } catch (e) {
      return null;
    }
  }
}