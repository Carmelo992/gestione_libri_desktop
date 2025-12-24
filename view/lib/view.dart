import 'dart:async';

import 'package:view/city/strings/city_page_strings.dart';
import 'package:view/city/strings/city_page_strings_impl.dart';
import 'package:view/features/clients/clients_list/clients_list_strings.dart';
import 'package:view/features/clients/clients_list/clients_list_strings_impl.dart';
import 'package:view/features/dashboard/dashboard_strings.dart';
import 'package:view/features/dashboard/dashboard_strings_impl.dart';
import 'package:view/features/users/user_details/user_details_strings.dart';
import 'package:view/features/users/user_details/user_details_strings_impl.dart';
import 'package:view/features/users/users_list/users_list_strings.dart';
import 'package:view/features/users/users_list/users_list_strings_impl.dart';
import 'package:view/features/years/years_list/years_list_strings.dart';
import 'package:view/features/years/years_list/years_list_strings_impl.dart';
import 'package:view/login/login_strings.dart';
import 'package:view/login/login_strings_impl.dart';

export 'package:view/city/city_page.dart';
export 'package:view/features/clients/clients_list/clients_page.dart';
export 'package:view/features/dashboard/dashboard_page.dart';
export 'package:view/features/users/user_details/user_not_found_page.dart';
export 'package:view/features/users/user_details/user_page.dart';
export 'package:view/features/users/users_list/users_page.dart';
export 'package:view/features/years/years_list/years_page.dart';
export 'package:view/login/login_page.dart';
export 'package:view/widget/navigation/navigation.dart';

class View {
  static void inject({
    required Function<T extends Object>(
      T Function() factoryFunc, {
      String? instanceName,
      FutureOr Function(T param)? dispose,
    })
    registerSingletonIfAbsent,
    required T Function<T extends Object>({String? instanceName}) inject,
  }) {
    registerSingletonIfAbsent<LoginStrings>(() => LoginStringsImpl(inject));
    registerSingletonIfAbsent<DashboardStrings>(() => DashboardStringsImpl(inject));
    registerSingletonIfAbsent<CityPageStrings>(() => CityPageStringsImpl(inject));
    registerSingletonIfAbsent<UserDetailsStrings>(() => UserDetailsStringsImpl(inject));
    registerSingletonIfAbsent<UsersListStrings>(() => UsersListStringsImpl(inject));
    registerSingletonIfAbsent<ClientsListStrings>(() => ClientsListStringsImpl(inject));
    registerSingletonIfAbsent<YearsListStrings>(() => YearsListStringsImpl(inject));
  }
}
