import 'package:flutter/material.dart';
import 'package:view/city/strings/city_page_strings.dart';
import 'package:view/injectable.dart';
import 'package:view/widget/custom_table_view.dart';

class CityPage extends InjectableStateful {
  const CityPage(super.inject, {super.key});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  CityPageStrings get strings => widget.inject();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(strings.pageTitle),
        Expanded(
          child: CustomTableView(
            columns: [
              CustomTableColumn(index: 0, label: "Id", width: 60, freezePriority: 100),
              CustomTableColumn(index: 1, label: "-", width: 100, flex: 1),
              CustomTableColumn(index: 2, label: "-", width: 100),
              CustomTableColumn(index: 3, label: "-", width: 100),
              CustomTableColumn(index: 4, label: "-", width: 100),
              CustomTableColumn(index: 5, label: "-", width: 100),
              CustomTableColumn(index: 6, label: "-", width: 100),
              CustomTableColumn(index: 7, label: "-", width: 100),
              CustomTableColumn(index: 8, label: "-", width: 100, freezePriority: 100),
            ],
            cellBuilder: (column, itemIndex) => Text(itemIndex.toString()),
            itemLength: 20,
          ),
        ),
      ],
    );
  }
}
