import 'package:model/clients/client_model.dart';
import 'package:model/clients/client_service.dart';
import 'package:model/clients/dummy_clients.dart';
import 'package:model/injectable.dart';
import 'package:model/session/session_service.dart';

class ClientServiceImpl extends Injectable implements ClientService {
  final SessionService sessionService;

  ClientServiceImpl(super.inject) : sessionService = inject();

  @override
  Future<List<ClientModel>> loadClients() async {
    await Future.delayed(Duration(seconds: 1));
    return dummyClients;
  }

  @override
  Future<ClientModel?> loadClient(String clientId) async {
    await Future.delayed(Duration(seconds: 1));
    return dummyClients.where((device) => device.id == clientId).firstOrNull;
  }
}
