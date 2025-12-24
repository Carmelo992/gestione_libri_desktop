import 'package:flutter/foundation.dart';
import 'package:model/model.dart';
import 'package:view_model/clients/client_ui_model.dart';
import 'package:view_model/clients/clients_view_model.dart';
import 'package:view_model/years/year_ui_model.dart';
import 'package:view_model/years/years_view_model.dart';

class YearsViewModelImpl implements YearsViewModel {
  final YearService service;

  YearsViewModelImpl(T Function<T extends Object>() inject) : service = inject() {
    service.loadYears().then((years) {
      this.years.value = years.map((year) => YearUIModel.fromModel(year)).toList();
    });
  }

  @override
  ValueNotifier<List<YearUIModel>> years = ValueNotifier([]);
}
