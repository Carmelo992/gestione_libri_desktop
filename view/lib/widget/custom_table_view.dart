import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_table_view/material_table_view.dart';
import 'package:view/injectable.dart';
import 'package:view/widget/custom_table/custom_table_strings.dart';

class CustomTableView extends InjectableStateful {
  final int initialPage;
  final int itemsPerPage;
  final int itemLength;
  final ValueNotifier<int> page;
  final ValueNotifier<int> pageSize;
  final List<CustomTableColumn> columns;
  final Widget Function(int column, int itemIndex) cellBuilder;
  final ValueChanged<int>? pageChanged;
  final ValueChanged<int>? onDelete;
  final ValueChanged<int>? showDetails;

  CustomTableStrings get strings => inject();

  CustomTableView(
    super.inject, {
    required List<CustomTableColumn> columns,
    required this.cellBuilder,
    required this.itemLength,
    this.initialPage = 1,
    this.itemsPerPage = 10,
    this.pageChanged,
    this.onDelete,
    this.showDetails,
    super.key,
  }) : page = ValueNotifier(initialPage),
       pageSize = ValueNotifier(itemsPerPage),
       columns = [
         ...columns,
         if (!columns.any((column) => column.flex > 0)) CustomTableColumn(index: -1, width: 100, flex: 1, label: ""),
         if (onDelete != null) CustomTableColumn(index: -2, width: 40, label: ""),
         if (showDetails != null) CustomTableColumn(index: -3, width: 40, label: ""),
       ];

  @override
  State<CustomTableView> createState() => _CustomTableViewState();
}

class _CustomTableViewState extends State<CustomTableView> {
  int get numberOfPages => (widget.itemLength / widget.itemsPerPage).ceil();

  ValueNotifier<int?> onRowOver = ValueNotifier(-1);

  @override
  Widget build(BuildContext context) {
    return widget.itemLength == 0
        ? Center(child: Text(widget.strings.noItemToShow))
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: widget.pageSize,
                  builder: (context, pageSize, child) {
                    return TableView.builder(
                      style: TableViewStyle(
                        dividers: TableViewDividersStyle(
                          vertical: TableViewVerticalDividersStyle.symmetric(
                            TableViewVerticalDividerStyle(wiggleCount: 0),
                          ),
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
                      columns: widget.columns,
                      rowCount: pageSize,
                      rowHeight: 40,
                      headerHeight: 30,
                      headerBuilder: (context, contentBuilder) => contentBuilder(context, (context, column) {
                        return Center(child: Text(widget.columns.elementAt(column).label));
                      }),
                      rowBuilder: (context, row, contentBuilder) => contentBuilder(
                        context,
                        (context, column) => Align(
                          alignment: Alignment.centerLeft,
                          child: MouseRegion(
                            onEnter: (event) {
                              var itemIndex = ((widget.page.value - 1) * pageSize) + row;
                              if (itemIndex >= widget.itemLength) return;
                              onRowOver.value = row;
                            },
                            onExit: (event) {
                              onRowOver.value = -1;
                            },
                            child: ValueListenableBuilder(
                              valueListenable: onRowOver,
                              builder: (context, value, child) {
                                return Container(
                                  color: value == row ? Colors.grey.withValues(alpha: 0.2) : null,
                                  width: double.infinity,
                                  height: double.infinity,
                                  padding: .all(5),
                                  child: ValueListenableBuilder(
                                    valueListenable: widget.page,
                                    builder: (context, page, child) {
                                      var columnItem = widget.columns.elementAt(column);
                                      var itemIndex = ((page - 1) * pageSize) + row;
                                      if (itemIndex >= widget.itemLength) return Container();
                                      if (column >= widget.columns.length) return Container();
                                      if (columnItem.index >= 0) {
                                        return widget.cellBuilder(column, ((page - 1) * pageSize) + row);
                                      }
                                      return switch (columnItem.index) {
                                        -2 => InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog.adaptive(
                                                content: Text(widget.strings.deleteItemMessage),
                                                actions: [
                                                  TextButton(
                                                    onPressed: Navigator.of(context).pop,
                                                    child: Text(widget.strings.cancel),
                                                  ),
                                                  TextButton(
                                                    onPressed: () => Navigator.of(context).pop(true),
                                                    child: Text(widget.strings.confirm),
                                                  ),
                                                ],
                                              ),
                                            ).then((value) {
                                              if (value == true) {
                                                widget.onDelete?.call(itemIndex);
                                              }
                                            });
                                          },
                                          child: Icon(Icons.delete_outline),
                                        ),
                                        -3 => InkWell(
                                          onTap: () => widget.showDetails?.call(itemIndex),
                                          child: Icon(Icons.insert_drive_file_outlined),
                                        ),
                                        > 0 => widget.cellBuilder(column, ((page - 1) * pageSize) + row),
                                        _ => Container(),
                                      };
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const .symmetric(vertical: 8, horizontal: 16),
                child: ValueListenableBuilder(
                  valueListenable: widget.page,
                  builder: (context, page, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: page == 1 ? null : () => changePage(1),
                          child: Icon(Icons.keyboard_double_arrow_left),
                        ),
                        InkWell(
                          onTap: page == 1 ? null : () => changePage(page - 1),
                          child: Icon(Icons.keyboard_arrow_left),
                        ),
                        Text(page.toString()),
                        InkWell(
                          onTap: page == numberOfPages ? null : () => changePage(page + 1),
                          child: Icon(Icons.keyboard_arrow_right),
                        ),
                        InkWell(
                          onTap: page == numberOfPages ? null : () => changePage(numberOfPages),
                          child: Icon(Icons.keyboard_double_arrow_right),
                        ),
                        Text(
                          "${(page - 1) * widget.itemsPerPage + 1}...${min(widget.itemLength, (page * widget.itemsPerPage + 1))}"
                              .toString(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
  }

  void changePage(int page) {
    widget.page.value = page;
    widget.pageChanged?.call(page);
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
