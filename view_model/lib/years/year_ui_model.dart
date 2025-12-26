import 'package:model/model.dart';

class YearUIModel {
  final String id;
  final String name;

  YearUIModel.fromModel(YearModel year) : id = year.id, name = year.name;
}
