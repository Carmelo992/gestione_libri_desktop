import 'package:view/features/injectable.dart';
import 'package:view/features/years/year_details/year_details_strings.dart';
import 'package:view/generated/app_localizations.dart';

class YearDetailsStringsImpl extends Injectable implements YearDetailsStrings {
  AppLocalization get localization => inject();

  YearDetailsStringsImpl(super.inject);

  @override
  String get title => localization.pageNotFound;

  @override
  String message(String id) => localization.yearNotFound(id: id);

  @override
  String get backMessage => localization.backMessage;

  @override
  String yearId(String yearId) => localization.id(id: yearId);
}
