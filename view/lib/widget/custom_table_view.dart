import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_table_view/material_table_view.dart';

class CustomTableView extends StatelessWidget {
  final int initialPage;
  final int itemsPerPage;
  final int itemLength;
  final ValueNotifier<int> page;
  final ValueNotifier<int> pageSize;
  final List<CustomTableColumn> columns;
  final Widget Function(int column, int itemIndex) cellBuilder;
  final ValueChanged<int>? pageChanged;

  int get numberOfPages => (itemLength / itemsPerPage).ceil();

  CustomTableView({
    required this.columns,
    required this.cellBuilder,
    required this.itemLength,
    this.initialPage = 1,
    this.itemsPerPage = 10,
    this.pageChanged,
    super.key,
  }) : page = ValueNotifier(initialPage),
       pageSize = ValueNotifier(itemsPerPage);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: pageSize,
            builder: (context, pageSize, child) {
              return TableView.builder(
                style: TableViewStyle(
                  dividers: TableViewDividersStyle(
                    vertical: TableViewVerticalDividersStyle.symmetric(TableViewVerticalDividerStyle(wiggleCount: 0)),
                  ),
                  scrollbars: const TableViewScrollbarsStyle.symmetric(
                    TableViewScrollbarStyle(
                      interactive: true,
                      enabled: TableViewScrollbarEnabled.always,
                      thumbVisibility: WidgetStatePropertyAll(true),
                      trackVisibility: WidgetStatePropertyAll(true),
                    ),
                  ),
                ),
                columns: columns,
                rowCount: pageSize,
                rowHeight: 60,
                headerHeight: 30,
                headerBuilder: (context, contentBuilder) =>
                    contentBuilder(context, (context, column) => Text(columns.elementAt(column).label)),
                rowBuilder: (context, row, contentBuilder) => contentBuilder(
                  context,
                  (context, column) => ValueListenableBuilder(
                    valueListenable: page,
                    builder: (context, page, child) {
                      var itemIndex = ((page - 1) * pageSize) + row;
                      if (itemIndex >= itemLength) return Container();
                      return cellBuilder(column, ((page - 1) * pageSize) + row);
                    },
                  ),
                ),
              );
            },
          ),
        ),
        ValueListenableBuilder(
          valueListenable: page,
          builder: (context, page, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(onTap: page == 1 ? null : () => changePage(1), child: Icon(Icons.keyboard_double_arrow_left)),
                InkWell(onTap: page == 1 ? null : () => changePage(page - 1), child: Icon(Icons.keyboard_arrow_left)),
                Text(page.toString()),
                InkWell(
                  onTap: page == numberOfPages ? null : () => changePage(page + 1),
                  child: Icon(Icons.keyboard_arrow_right),
                ),
                InkWell(
                  onTap: page == numberOfPages ? null : () => changePage(numberOfPages),
                  child: Icon(Icons.keyboard_double_arrow_right),
                ),
                Text("${(page - 1) * itemsPerPage + 1}...${min(itemLength, (page * itemsPerPage + 1))}".toString()),
              ],
            );
          },
        ),
      ],
    );
  }

  void changePage(int page) {
    this.page.value = page;
    pageChanged?.call(page);
  }
}

class CustomTableColumn extends TableColumn {
  CustomTableColumn({
    required this.index,
    required this.label,
    required super.width,
    super.freezePriority = 0,
    super.sticky = false,
    super.flex = 0,
    super.translation = 0,
    super.minResizeWidth,
    super.maxResizeWidth,
  }) : key = ValueKey<int>(index);

  final int index;
  final String label;

  @override
  final ValueKey<int> key;

  @override
  CustomTableColumn copyWith({
    double? width,
    int? freezePriority,
    bool? sticky,
    int? flex,
    double? translation,
    double? minResizeWidth,
    double? maxResizeWidth,
  }) => CustomTableColumn(
    index: index,
    label: label,
    width: width ?? this.width,
    freezePriority: freezePriority ?? this.freezePriority,
    sticky: sticky ?? this.sticky,
    flex: flex ?? this.flex,
    translation: translation ?? this.translation,
    minResizeWidth: minResizeWidth ?? this.minResizeWidth,
    maxResizeWidth: maxResizeWidth ?? this.maxResizeWidth,
  );
}
