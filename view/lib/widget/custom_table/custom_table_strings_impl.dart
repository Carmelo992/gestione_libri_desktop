import 'package:view/generated/app_localizations.dart';
import 'package:view/injectable.dart';
import 'package:view/widget/custom_table/custom_table_strings.dart';

class CustomTableStringsImpl extends Injectable implements CustomTableStrings {
  AppLocalization get localization => inject();

  CustomTableStringsImpl(super.inject);

  @override
  String get noItemToShow => localization.noItemToShow;

  @override
  String get confirm => localization.confirm;

  @override
  String get cancel => localization.cancel;

  @override
  String get deleteItemMessage => localization.deleteItemMessage;
}
