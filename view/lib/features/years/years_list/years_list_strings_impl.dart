import 'package:view/features/injectable.dart';
import 'package:view/features/years/years_list/years_list_strings.dart';
import 'package:view/generated/app_localizations.dart';

class YearsListStringsImpl extends Injectable implements YearsListStrings {
  AppLocalization get localization => inject();

  YearsListStringsImpl(super.inject);

  @override
  String get title => localization.yearPageTitle;

  @override
  String get subtitle => localization.yearPageSubtitle;

  @override
  String get year => localization.year;
}
