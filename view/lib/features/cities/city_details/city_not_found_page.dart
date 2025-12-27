import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:view/features/cities/city_details/city_details_strings.dart';

class CityNotFoundPage extends StatelessWidget {
  final CityDetailsStrings strings;

  const CityNotFoundPage({super.key, required this.cityId, required this.strings});

  final String cityId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(strings.title, style: Theme.of(context).textTheme.headlineMedium),
            const Gap(8),
            Text(strings.message(cityId)),
          ],
        ),
      ),
    );
  }
}
