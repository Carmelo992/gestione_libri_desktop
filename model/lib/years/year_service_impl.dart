import 'package:model/injectable.dart';
import 'package:model/session/session_service.dart';
import 'package:model/years/dummy_year.dart';
import 'package:model/years/year_model.dart';
import 'package:model/years/year_service.dart';

class YearServiceImpl extends Injectable implements YearService {
  final SessionService sessionService;

  YearServiceImpl(super.inject) : sessionService = inject();

  @override
  Future<List<YearModel>> loadYears() async {
    await Future.delayed(Duration(seconds: 1));
    return dummyYears;
  }

  @override
  Future<YearModel?> loadYear(String yearId) async {
    await Future.delayed(Duration(seconds: 1));
    return dummyYears.where((year) => year.id == yearId).firstOrNull;
  }
}
