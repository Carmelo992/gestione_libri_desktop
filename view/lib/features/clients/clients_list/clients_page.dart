import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:view/features/clients/clients_list/clients_list_strings.dart';
import 'package:view/injectable.dart';
import 'package:view/widget/content_view.dart';
import 'package:view/widget/custom_table_view.dart';
import 'package:view/widget/page_header.dart';
import 'package:view_model/view_model.dart';

class ClientsPage extends InjectableStateless {
  ClientsListStrings get strings => inject();

  const ClientsPage(super.inject, {super.key});

  @override
  Widget build(BuildContext context) {
    return ContentView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(title: strings.title, description: strings.subtitle),
          const Gap(16),
          const Gap(16),
          Expanded(child: _TableView(inject)),
        ],
      ),
    );
  }
}

class _TableView extends InjectableStateless {
  ClientsViewModel get vm => inject();

  ClientsListStrings get strings => inject();

  const _TableView(super.inject);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ValueListenableBuilder(
        valueListenable: vm.clients,
        builder: (context, clients, child) {
          if (clients.isEmpty) return Center(child: CircularProgressIndicator());
          return CustomTableView(
            columns: [
              CustomTableColumn(index: 0, label: strings.clientId, width: 200),
              CustomTableColumn(index: 1, label: strings.clientName, width: 100, flex: 1),
            ],
            cellBuilder: (column, itemIndex) => switch(column){
              0 => Text(clients[itemIndex].id.toString()),
              1 => Text(clients[itemIndex].name),
            _ => Container(),
            },
            itemLength: clients.length,
          );
        },
      ),
    );
  }
}
