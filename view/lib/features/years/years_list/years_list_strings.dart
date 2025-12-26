abstract interface class YearsListStrings {
  String get title;

  String get subtitle;

  String get year;

  String yearAlreadyAdded(String year);

  String get error;

  String get close;

  String get cancel;

  String get continueText;

  String get newYear;

  String createNewYear(String year);

  String newYearError(String year);
}
