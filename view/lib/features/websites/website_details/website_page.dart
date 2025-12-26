import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:view/features/websites/website_details/website_details_strings.dart';
import 'package:view/features/websites/website_details/website_not_found_page.dart';
import 'package:view/injectable.dart';
import 'package:view/widget/content_view.dart';
import 'package:view_model/view_model.dart';

class WebSitePage extends InjectableStateless {
  WebSiteDetailsViewModel get vm => inject();

  WebsiteDetailsStrings get strings => inject();

  WebSitePage(super.inject, {super.key, required this.websiteId}) {
    vm.loadDetails(websiteId);
  }

  final String websiteId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ValueListenableBuilder(
      valueListenable: vm.isLoading,
      builder: (context, isLoading, child) {
        if (isLoading) return Center(child: CircularProgressIndicator());
        return ValueListenableBuilder(
          valueListenable: vm.details,
          builder: (context, website, child) {
            if (website == null) return WebsiteNotFoundPage(websiteId: websiteId, strings: strings);
            return ContentView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(website.name, style: theme.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700)),
                  Text(strings.websiteId(website.id)),
                  const Gap(16),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.navigate_before),
                    label: Text(strings.backMessage),
                    onPressed: Navigator.of(context).pop,
                  ),
                  const Gap(16),
                  Row(
                    children: [
                      Text(strings.webSiteRow),
                      Gap(8),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            launchUrlString(website.url);
                          },
                          child: Text(website.url),
                        ),
                      ),
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
