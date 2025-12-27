import 'package:view/features/cities/city_list/city_list_strings.dart';
import 'package:view/features/injectable.dart';
import 'package:view/generated/app_localizations.dart';

class CityListStringsImpl extends Injectable implements CityListStrings {
  AppLocalization get localization => inject();

  CityListStringsImpl(super.inject);

  @override
  String get title => localization.cityPageTitle;

  @override
  String get subtitle => localization.cityPageSubtitle;

  @override
  String get cityName => localization.cityName;

  @override
  String get cityCode => localization.cityCode;

  @override
  String cityAlreadyAdded(String city) => localization.cityAlreadyAdded(city: city);

  @override
  String get error => localization.error;

  @override
  String get close => localization.close;

  @override
  String get cancel => localization.cancel;

  @override
  String get continueText => localization.continueText;

  @override
  String get newCity => localization.newCity;

  @override
  String get createNewCity => localization.createNewCity;

  @override
  String newCityError(String city) => localization.newCityError(city: city);
}
