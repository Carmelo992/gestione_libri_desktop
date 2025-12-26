abstract interface class WebsitesListStrings {
  String get title;

  String get subtitle;

  String get websiteName;

  String get websiteUrl;

  String websiteAlreadyAdded(String website);

  String get error;

  String get close;

  String get cancel;

  String get continueText;

  String get newWebsite;

  String get createNewWebsite;

  String newWebsiteError(String website);
}
