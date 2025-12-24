import 'package:model/years/year_model.dart';

abstract interface class YearService {
  Future<List<YearModel>> loadYears();

  Future<YearModel?> loadYear(String yearId);
}
