import 'package:view/generated/app_localizations.dart';
import 'package:view/injectable.dart';
import 'package:view/widget/page_header/page_header_strings.dart';

class PageHeaderStringsImpl extends Injectable implements PageHeaderStrings {
  AppLocalization get localization => inject();

  const PageHeaderStringsImpl(super.inject);

  @override
  String get add => localization.add;
}
