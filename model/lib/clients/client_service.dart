import 'package:model/clients/client_model.dart';

abstract interface class ClientService {
  Future<List<ClientModel>> loadClients();

  Future<ClientModel?> loadClient(String clientId);
}
