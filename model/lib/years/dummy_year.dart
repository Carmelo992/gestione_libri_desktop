import 'package:model/years/year_model.dart';

List<YearModel> dummyYears = _json.map((json) {
  if (json case {'id': final String id, 'name': final String name}) {
    return YearModel(id: id, name: name);
  } else {
    throw const FormatException('Unexpected JSON');
  }
}).toList();

const _json = [
  {'id': 'd51b4a1e-3c25-4e81', 'name': '2020-2021'},
  {'id': '9c6a544a-4edf-4a76', 'name': '2021-2022'},
  {'id': '2f46f92f-9d57-4e04', 'name': '2022-2023'},
  {'id': '92b4e3a9-5c5f-4b44', 'name': '2023-2024'},
  {'id': '0b192083-8f70-415b', 'name': '2024-2025'},
  {'id': '1dd76cb0-cd01-4d3c', 'name': '2025-2026'},
];
