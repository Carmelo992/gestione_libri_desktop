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

  const YearsPage(super.inject, {super.key});

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
  YearsViewModel get vm => inject();

  YearsListStrings get strings => inject();

  const _TableView(super.inject);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ValueListenableBuilder(
        valueListenable: vm.years,
        builder: (context, years, child) {
          if (years.isEmpty) return Center(child: CircularProgressIndicator());
          return CustomTableView(
            columns: [CustomTableColumn(index: 0, label: strings.year, width: 100)],
            cellBuilder: (column, itemIndex) => Text(years.elementAt(itemIndex).name),
            itemLength: years.length,
          );
        },
      ),
    );
  }
}
