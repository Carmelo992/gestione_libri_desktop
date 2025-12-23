import 'package:flutter/foundation.dart';
import 'package:view_model/clients/client_ui_model.dart';

abstract interface class ClientsViewModel {
  ValueListenable<List<ClientUIModel>> get clients;
}
