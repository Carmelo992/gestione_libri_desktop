import 'package:view/features/injectable.dart';
import 'package:view/features/users/user_details/user_details_strings.dart';
import 'package:view/generated/app_localizations.dart';

class UserDetailsStringsImpl extends Injectable implements UserDetailsStrings {
  AppLocalization get localization => inject();

  UserDetailsStringsImpl(super.inject);

  @override
  String get title => localization.pageNotFound;

  @override
  String message(String id) => localization.userNotFound(id: id);

  @override
  String get backMessage => localization.backMessage;

  @override
  String userRole(String role) => localization.userRole(role: role);

  @override
  String userId(String userId) => localization.id(id: userId);
}
