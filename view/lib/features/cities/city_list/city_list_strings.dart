abstract interface class CityListStrings {
  String get title;

  String get subtitle;

  String get cityName;

  String get cityCode;

  String cityAlreadyAdded(String city);

  String get error;

  String get close;

  String get cancel;

  String get continueText;

  String get newCity;

  String get createNewCity;

  String newCityError(String city);
}
