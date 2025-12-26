import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:view/features/years/year_details/year_details_strings.dart';
import 'package:view/features/years/year_details/year_not_found_page.dart';
import 'package:view/injectable.dart';
import 'package:view/widget/content_view.dart';
import 'package:view_model/years/year_details_view_model.dart';

class YearPage extends InjectableStateless {
  YearDetailsViewModel get vm => inject();

  YearDetailsStrings get strings => inject();

  YearPage(super.inject, {super.key, required this.yearId}) {
    vm.loadDetails(yearId);
  }

  final String yearId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ValueListenableBuilder(
      valueListenable: vm.isLoading,
      builder: (context, isLoading, child) {
        if (isLoading) return Center(child: CircularProgressIndicator());
        return ValueListenableBuilder(
          valueListenable: vm.details,
          builder: (context, year, child) {
            if (year == null) return YearNotFoundPage(yearId: yearId, strings: strings);
            return ContentView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(year.name, style: theme.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700)),
                  Text(strings.yearId(year.id)),
                  const Gap(16),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.navigate_before),
                    label: Text(strings.backMessage),
                    onPressed: Navigator.of(context).pop,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
