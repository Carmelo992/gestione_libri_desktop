import 'package:view/city/strings/city_page_strings.dart';
import 'package:view/generated/app_localizations.dart';
import 'package:view/injectable.dart';

class CityPageStringsImpl extends Injectable implements CityPageStrings {
  AppLocalization get localization => inject();

  CityPageStringsImpl(super.inject);

  @override
  String get pageTitle => localization.cityPageTitle;
}
