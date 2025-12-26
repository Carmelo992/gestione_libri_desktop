import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:view/features/years/year_details/year_details_strings.dart';

class YearNotFoundPage extends StatelessWidget {
  final YearDetailsStrings strings;

  const YearNotFoundPage({super.key, required this.yearId, required this.strings});

  final String yearId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(strings.title, style: Theme.of(context).textTheme.headlineMedium),
            const Gap(8),
            Text(strings.message(yearId)),
          ],
        ),
      ),
    );
  }
}
