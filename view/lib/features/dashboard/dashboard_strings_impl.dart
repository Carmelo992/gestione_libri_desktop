import 'package:view/features/dashboard/dashboard_strings.dart';
import 'package:view/features/injectable.dart';
import 'package:view/generated/app_localizations.dart';

class DashboardStringsImpl extends Injectable implements DashboardStrings {
  AppLocalization get localization => inject();

  DashboardStringsImpl(super.inject);

  @override
  String get title => localization.dashboardPageTitle;

  @override
  String get subtitle => localization.dashboardPageSubtitle;

}
