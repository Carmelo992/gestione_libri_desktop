import 'package:view/features/cities/city_details/city_details_strings.dart';
import 'package:view/features/injectable.dart';
import 'package:view/generated/app_localizations.dart';

class CityDetailsStringsImpl extends Injectable implements CityDetailsStrings {
  AppLocalization get localization => inject();

  CityDetailsStringsImpl(super.inject);

  @override
  String get title => localization.cityPageTitle;

  @override
  String message(String id) => localization.cityNotFound(id: id);

  @override
  String get backMessage => localization.backMessage;

  @override
  String get cityCodeRow => localization.cityCodeRow;

  @override
  String cityId(String cityId) => localization.id(id: cityId);
}
