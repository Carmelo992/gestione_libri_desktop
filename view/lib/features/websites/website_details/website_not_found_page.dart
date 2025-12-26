import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:view/features/websites/website_details/website_details_strings.dart';

class WebsiteNotFoundPage extends StatelessWidget {
  final WebsiteDetailsStrings strings;

  const WebsiteNotFoundPage({super.key, required this.websiteId, required this.strings});

  final String websiteId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(strings.title, style: Theme.of(context).textTheme.headlineMedium),
            const Gap(8),
            Text(strings.message(websiteId)),
          ],
        ),
      ),
    );
  }
}
