import 'package:model/clients/client_model.dart';

List<ClientModel> dummyClients = _json.map((json) {
  if (json case {'id': final String id, 'name': final String name}) {
    return ClientModel(id: id, name: name);
  } else {
    throw const FormatException('Unexpected JSON');
  }
}).toList();

const _json = [
  {'id': 'd51b4a1e-3c25-4e81', 'name': 'Cliente-001'},
  {'id': '9c6a544a-4edf-4a76', 'name': 'Cliente-002'},
  {'id': '2f46f92f-9d57-4e04', 'name': 'Cliente-003'},
  {'id': '92b4e3a9-5c5f-4b44', 'name': 'Cliente-004'},
  {'id': '0b192083-8f70-415b', 'name': 'Cliente-005'},
  {'id': '1dd76cb0-cd01-4d3c', 'name': 'Cliente-006'},
  {'id': 'f76c47e3-49f6-4d4f', 'name': 'Cliente-007'},
  {'id': 'd51e5f92-cda5-4f54', 'name': 'Cliente-008'},
  {'id': 'a429f3f3-348d-4455', 'name': 'Cliente-009'},
  {'id': 'e932a54c-882d-45a5', 'name': 'Cliente-010'},
  {'id': '8250f8f3-aae5-4e6b', 'name': 'Cliente-011'},
  {'id': 'bf925d9a-745f-4d66', 'name': 'Cliente-012'},
  {'id': 'c1deada9-e784-4f2b', 'name': 'Cliente-013'},
  {'id': '127a56b7-b6b6-4e8a', 'name': 'Cliente-014'},
  {'id': 'a4acde7d-8d02-4d9a', 'name': 'Cliente-015'},
  {'id': '19d2ac0a-9a92-4b14', 'name': 'Cliente-016'},
  {'id': '3ef6e349-663a-4b2f', 'name': 'Cliente-017'},
  {'id': '9c7eb895-71ca-423c', 'name': 'Cliente-018'},
  {'id': '4b29f0e2-29d1-43a1', 'name': 'Cliente-019'},
  {'id': 'b1998d4a-7bb6-460a', 'name': 'Cliente-020'},
];
