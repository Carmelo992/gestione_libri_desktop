import 'package:flutter/foundation.dart';
import 'package:view_model/years/year_ui_model.dart';

abstract interface class YearsViewModel {
  ValueListenable<List<YearUIModel>> get years;
}
