import 'package:model/years/api/auth/year_response.dart';

class YearModel {
  final String id;
  final String name;

  YearModel.fromApi(YearResponse model) : id = model.id.toString(), name = model.name;
}
