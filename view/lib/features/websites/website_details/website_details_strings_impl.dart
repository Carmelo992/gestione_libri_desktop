import 'package:view/features/injectable.dart';
import 'package:view/features/websites/website_details/website_details_strings.dart';
import 'package:view/generated/app_localizations.dart';

class WebsiteDetailsStringsImpl extends Injectable implements WebsiteDetailsStrings {
  AppLocalization get localization => inject();

  WebsiteDetailsStringsImpl(super.inject);

  @override
  String get title => localization.websitePageTitle;

  @override
  String message(String id) => localization.websiteNotFound(id: id);

  @override
  String get backMessage => localization.backMessage;

  @override
  String get webSiteRow => localization.webSiteRow;

  @override
  String websiteId(String yearId) => localization.id(id: yearId);
}
