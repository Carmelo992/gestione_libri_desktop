import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:view/features/websites/websites_list/websites_list_strings.dart';
import 'package:view/injectable.dart';
import 'package:view/widget/content_view.dart';
import 'package:view/widget/custom_table_view.dart';
import 'package:view/widget/page_header/page_header.dart';
import 'package:view_model/view_model.dart';

class WebsitesPage extends InjectableStateless {
  WebsitesListStrings get strings => inject();

  WebSitesViewModel get vm => inject();
  final ValueChanged<String> openDetails;

  const WebsitesPage(super.inject, {required this.openDetails, super.key});

  @override
  Widget build(BuildContext context) {
    return ContentView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable: vm.items,
            builder: (context, websites, child) {
              return PageHeader(
                inject,
                title: strings.title,
                description: strings.subtitle,
                onAdd: websites == null
                    ? null
                    : () {
                        TextEditingController _websiteUrlController = TextEditingController();
                        TextEditingController _websiteNameController = TextEditingController();
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Material(
                              type: MaterialType.transparency,
                              child: AlertDialog.adaptive(
                                title: Text(strings.newWebsite),
                                content: Column(
                                  children: [
                                    Text(strings.createNewWebsite),
                                    TextField(
                                      controller: _websiteNameController,
                                      decoration: InputDecoration(hintText: strings.websiteName),
                                      textCapitalization: TextCapitalization.words,
                                    ),
                                    TextField(
                                      controller: _websiteUrlController,
                                      textCapitalization: TextCapitalization.none,
                                      decoration: InputDecoration(hintText: strings.websiteUrl),
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
                          String websiteName = _websiteNameController.text;
                          String websiteUrl = _websiteUrlController.text;
                          if (!context.mounted) return;
                          if (websites
                              .where((element) => element.name == websiteName || element.url == websiteUrl)
                              .isNotEmpty) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog.adaptive(
                                title: Text(strings.error),
                                content: Text(strings.newWebsiteError(websiteName)),
                                actions: [TextButton(onPressed: Navigator.of(context).pop, child: Text(strings.close))],
                              ),
                            );
                            return;
                          }
                          if (toCreate == true) {
                            vm.createNewWebSite(websiteName, websiteUrl).then((yearId) {
                              if (yearId == null) {
                                if (!context.mounted) return;
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog.adaptive(
                                    title: Text(strings.error),
                                    content: Text(strings.websiteAlreadyAdded(websiteName)),
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
  WebSitesViewModel get vm => inject();

  WebsitesListStrings get strings => inject();

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
              CustomTableColumn(index: 0, label: strings.websiteName, width: 200),
              CustomTableColumn(index: 1, label: strings.websiteUrl, width: 100, flex: 1),
            ],
            cellBuilder: (column, itemIndex) {
              return Text(switch (column) {
                0 => websites.elementAt(itemIndex).name,
                1 => websites.elementAt(itemIndex).url,
                _ => "",
              });
            },
            itemLength: websites.length,
            showDetails: (itemIndex) => openDetails(websites[itemIndex].id),
            onDelete: (itemIndex) {
              vm.deleteWebSite(websites[itemIndex].id);
            },
          );
        },
      ),
    );
  }
}
