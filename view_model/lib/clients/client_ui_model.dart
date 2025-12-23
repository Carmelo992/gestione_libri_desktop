import 'package:model/model.dart';

class ClientUIModel {
  final String id;
  final String name;

  ClientUIModel.fromModel(ClientModel device) : id = device.id, name = device.name;
}
