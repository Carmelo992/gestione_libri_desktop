import 'package:view/features/clients/clients_list/clients_list_strings.dart';
import 'package:view/features/injectable.dart';
import 'package:view/generated/app_localizations.dart';

class ClientsListStringsImpl extends Injectable implements ClientsListStrings {
  AppLocalization get localization => inject();

  ClientsListStringsImpl(super.inject);

  @override
  String get title => localization.clientsPageTitle;

  @override
  String get subtitle => localization.clientsPageSubtitle;

  @override
  String get clientId => localization.clientId;

  @override
  String get clientName => localization.clientName;
}
