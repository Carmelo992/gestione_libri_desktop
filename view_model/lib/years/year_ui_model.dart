import 'package:model/model.dart';

class YearUIModel {
  final String id;
  final String name;

  YearUIModel.fromModel(YearModel device) : id = device.id, name = device.name;
}
