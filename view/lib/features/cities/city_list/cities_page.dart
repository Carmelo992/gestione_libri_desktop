import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:view/features/cities/city_list/city_list_strings.dart';
import 'package:view/injectable.dart';
import 'package:view/widget/content_view.dart';
import 'package:view/widget/custom_table_view.dart';
import 'package:view/widget/page_header/page_header.dart';
import 'package:view_model/view_model.dart';

class CityPage extends InjectableStateless {
  CityListStrings get strings => inject();

  CitiesViewModel get vm => inject();

  final ValueChanged<String> openDetails;

  const CityPage(super.inject, {required this.openDetails, super.key});

  @override
  Widget build(BuildContext context) {
    return ContentView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable: vm.items,
            builder: (context, cities, child) {
              return PageHeader(
                inject,
                title: strings.title,
                description: strings.subtitle,
                onAdd: cities == null
                    ? null
                    : () {
                        TextEditingController _cityCodeController = TextEditingController();
                        TextEditingController _cityNameController = TextEditingController();
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Material(
                              type: MaterialType.transparency,
                              child: AlertDialog.adaptive(
                                title: Text(strings.newCity),
                                content: Column(
                                  children: [
                                    Text(strings.createNewCity),
                                    TextField(
                                      controller: _cityNameController,
                                      decoration: InputDecoration(hintText: strings.cityName),
                                      textCapitalization: TextCapitalization.words,
                                    ),
                                    TextField(
                                      controller: _cityCodeController,
                                      textCapitalization: TextCapitalization.none,
                                      decoration: InputDecoration(hintText: strings.cityCode),
                                      keyboardType: TextInputType.url,
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(onPressed: Navigator.of(context).pop, child: Text(strings.cancel)),
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(true),
                                    child: Text(strings.continueText),
                                  ),
                                ],
                              ),
                            );
                          },
                        ).then((toCreate) {
                          String cityName = _cityNameController.text;
                          String cityCode = _cityCodeController.text;
                          if (!context.mounted) return;
                          if (cities
                              .where((element) => element.name == cityName || element.code == cityCode)
                              .isNotEmpty) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog.adaptive(
                                title: Text(strings.error),
                                content: Text(strings.newCityError(cityName)),
                                actions: [TextButton(onPressed: Navigator.of(context).pop, child: Text(strings.close))],
                              ),
                            );
                            return;
                          }
                          if (toCreate == true) {
                            vm.createNewCity(cityName, cityCode).then((yearId) {
                              if (yearId == null) {
                                if (!context.mounted) return;
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog.adaptive(
                                    title: Text(strings.error),
                                    content: Text(strings.cityAlreadyAdded(cityName)),
                                    actions: [
                                      TextButton(onPressed: Navigator.of(context).pop, child: Text(strings.close)),
                                    ],
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
  CitiesViewModel get vm => inject();

  CityListStrings get strings => inject();

  final ValueChanged<String> openDetails;

  const _TableView(super.inject, {required this.openDetails});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ValueListenableBuilder(
        valueListenable: vm.items,
        builder: (context, websites, child) {
          if (websites == null) return Center(child: CircularProgressIndicator());
          return CustomTableView(
            inject,
            columns: [
              CustomTableColumn(index: 0, label: strings.cityName, width: 200),
              CustomTableColumn(index: 1, label: strings.cityCode, width: 100, flex: 1),
            ],
            cellBuilder: (column, itemIndex) {
              return Text(switch (column) {
                0 => websites.elementAt(itemIndex).name,
                1 => websites.elementAt(itemIndex).code,
                _ => "",
              });
            },
            itemLength: websites.length,
            showDetails: (itemIndex) => openDetails(websites[itemIndex].id),
            onDelete: (itemIndex) {
              vm.deleteCity(websites[itemIndex].id);
            },
          );
        },
      ),
    );
  }
}
