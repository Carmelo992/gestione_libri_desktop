import 'package:view/features/injectable.dart';
import 'package:view/features/users/users_list/users_list_strings.dart';
import 'package:view/generated/app_localizations.dart';

class UsersListStringsImpl extends Injectable implements UsersListStrings {
  AppLocalization get localization => inject();

  UsersListStringsImpl(super.inject);

  @override
  String get title => localization.usersPageTitle;

  @override
  String get subtitle => localization.usersPageSubtitle;
}
