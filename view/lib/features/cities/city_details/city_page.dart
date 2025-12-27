import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:view/features/cities/city_details/city_details_strings.dart';
import 'package:view/features/cities/city_details/city_not_found_page.dart';
import 'package:view/injectable.dart';
import 'package:view/widget/content_view.dart';
import 'package:view_model/view_model.dart';

class CityPage extends InjectableStateless {
  CityDetailsViewModel get vm => inject();

  CityDetailsStrings get strings => inject();

  CityPage(super.inject, {super.key, required this.cityId}) {
    vm.loadDetails(cityId);
  }

  final String cityId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ValueListenableBuilder(
      valueListenable: vm.isLoading,
      builder: (context, isLoading, child) {
        if (isLoading) return Center(child: CircularProgressIndicator());
        return ValueListenableBuilder(
          valueListenable: vm.details,
          builder: (context, city, child) {
            if (city == null) return CityNotFoundPage(cityId: cityId, strings: strings);
            return ContentView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(city.name, style: theme.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700)),
                  Text(strings.cityId(city.id)),
                  const Gap(16),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.navigate_before),
                    label: Text(strings.backMessage),
                    onPressed: Navigator.of(context).pop,
                  ),
                  const Gap(16),
                  Row(
                    children: [
                      Text(strings.cityCodeRow),
                      Gap(8),
                      Expanded(child: Text(city.code)),
                    ],
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
