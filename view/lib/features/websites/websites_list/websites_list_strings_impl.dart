import 'package:view/features/injectable.dart';
import 'package:view/features/websites/websites_list/websites_list_strings.dart';
import 'package:view/generated/app_localizations.dart';

class WebsitesListStringsImpl extends Injectable implements WebsitesListStrings {
  AppLocalization get localization => inject();

  WebsitesListStringsImpl(super.inject);

  @override
  String get title => localization.websitePageTitle;

  @override
  String get subtitle => localization.websitePageSubtitle;

  @override
  String get websiteName => localization.websiteName;

  @override
  String get websiteUrl => localization.websiteUrl;

  @override
  String websiteAlreadyAdded(String website) => localization.websiteAlreadyAdded(website: website);

  @override
  String get error => localization.error;

  @override
  String get close => localization.close;

  @override
  String get cancel => localization.cancel;

  @override
  String get continueText => localization.continueText;

  @override
  String get newWebsite => localization.newWebsite;

  @override
  String get createNewWebsite => localization.createNewWebsite;

  @override
  String newWebsiteError(String website) => localization.newWebsiteError(website: website);
}
