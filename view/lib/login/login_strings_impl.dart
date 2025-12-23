import 'package:view/features/injectable.dart';
import 'package:view/generated/app_localizations.dart';
import 'package:view/login/login_strings.dart';

class LoginStringsImpl extends Injectable implements LoginStrings {
  AppLocalization get localization => inject();

  LoginStringsImpl(super.inject);

  @override
  String get email => localization.email;

  @override
  String get password => localization.password;

  @override
  String get login => localization.login;

  @override
  String loginError(String name) => localization.loginError(name: name);
}
