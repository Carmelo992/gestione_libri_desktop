import 'package:flutter/foundation.dart';
import 'package:model/model.dart';
import 'package:view_model/clients/client_ui_model.dart';
import 'package:view_model/clients/clients_view_model.dart';

class ClientsViewModelImpl implements ClientsViewModel {
  final ClientService service;

  ClientsViewModelImpl(T Function<T extends Object>() inject) : service = inject() {
    service.loadClients().then((clients) {
      this.clients.value = clients.map((client) => ClientUIModel.fromModel(client)).toList();
    });
  }

  @override
  ValueNotifier<List<ClientUIModel>> clients = ValueNotifier([]);
}
