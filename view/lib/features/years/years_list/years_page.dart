import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:view/features/years/years_list/years_list_strings.dart';
import 'package:view/injectable.dart';
import 'package:view/widget/content_view.dart';
import 'package:view/widget/custom_table_view.dart';
import 'package:view/widget/page_header.dart';
import 'package:view_model/view_model.dart';

class YearsPage extends InjectableStateless {
  YearsListStrings get strings => inject();

  YearsViewModel get vm => inject();
  final ValueChanged<String> openDetails;

  const YearsPage(super.inject, {required this.openDetails, super.key});

  @override
  Widget build(BuildContext context) {
    return ContentView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable: vm.items,
            builder: (context, years, child) {
              return PageHeader(
                title: strings.title,
                description: strings.subtitle,
                onAdd: years == null
                    ? null
                    : () {
                        var now = DateTime.now();
                        String newYear = "${now.year}-${now.year + 1}";
                        if (years.where((element) => element.name == newYear).isNotEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog.adaptive(
                              title: Text("Errore"),
                              content: Text("L'anno $newYear esiste già"),
                              actions: [TextButton(onPressed: Navigator.of(context).pop, child: Text("Chiudi"))],
                            ),
                          );
                          return;
                        }
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog.adaptive(
                              title: Text("Nuovo anno scolastico"),
                              content: Text("Creare anno scolastico ${now.year}-${now.year + 1}?"),
                              actions: [
                                TextButton(onPressed: Navigator.of(context).pop, child: Text("Annulla")),
                                TextButton(onPressed: () => Navigator.of(context).pop(true), child: Text("Continua")),
                              ],
                            );
                          },
                        ).then((toCreate) {
                          if (toCreate == true) {
                            vm.createNewYear(newYear).then((yearId) {
                              if (yearId == null) {
                                if (!context.mounted) return;
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog.adaptive(
                                    title: Text("Errore"),
                                    content: Text(
                                      "Sì è verificato un errore durante la creazione del nuovo anno '$newYear'",
                                    ),
                                    actions: [TextButton(onPressed: Navigator.of(context).pop, child: Text("Chiudi"))],
                                  ),
                                );
                                return;
                              }
                              openDetails(yearId);
                            });
                          }
                        });
                      },
              );
            },
          ),
          const Gap(16),
          const Gap(16),
          Expanded(child: _TableView(inject, openDetails: openDetails)),
        ],
      ),
    );
  }
}

class _TableView extends InjectableStateless {
  YearsViewModel get vm => inject();

  YearsListStrings get strings => inject();

  final ValueChanged<String> openDetails;

  const _TableView(super.inject, {required this.openDetails});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ValueListenableBuilder(
        valueListenable: vm.items,
        builder: (context, years, child) {
          if (years == null) return Center(child: CircularProgressIndicator());
          if (years.isEmpty) return Center(child: Text("Non ci sono elementi da visualizzare"));
          return CustomTableView(
            columns: [CustomTableColumn(index: 0, label: strings.year, width: 100)],
            cellBuilder: (column, itemIndex) => Text(years.elementAt(itemIndex).name),
            itemLength: years.length,
            showDetails: (itemIndex) => openDetails(years[itemIndex].id),
            onDelete: (itemIndex) {
              vm.deleteYear(years[itemIndex].id);
            },
          );
        },
      ),
    );
  }
}
