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

  @override
  String yearAlreadyAdded(String year) => localization.yearAlreadyAdded(year: year);

  @override
  String get error => localization.error;

  @override
  String get close => localization.close;

  @override
  String get cancel => localization.cancel;

  @override
  String get continueText => localization.continueText;

  @override
  String get newYear => localization.newYear;

  @override
  String createNewYear(String year) => localization.createNewYear(year: year);

  @override
  String newYearError(String year) => localization.newYearError(year: year);
}
