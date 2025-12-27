import 'dart:async';

import 'package:view/features/cities/city_details/city_details_strings.dart';
import 'package:view/features/cities/city_details/city_details_strings_impl.dart';
import 'package:view/features/cities/city_list/city_list_strings.dart';
import 'package:view/features/cities/city_list/city_list_strings_impl.dart';
import 'package:view/features/clients/clients_list/clients_list_strings.dart';
import 'package:view/features/clients/clients_list/clients_list_strings_impl.dart';
import 'package:view/features/dashboard/dashboard_strings.dart';
import 'package:view/features/dashboard/dashboard_strings_impl.dart';
import 'package:view/features/users/user_details/user_details_strings.dart';
import 'package:view/features/users/user_details/user_details_strings_impl.dart';
import 'package:view/features/users/users_list/users_list_strings.dart';
import 'package:view/features/users/users_list/users_list_strings_impl.dart';
import 'package:view/features/websites/website_details/website_details_strings.dart';
import 'package:view/features/websites/website_details/website_details_strings_impl.dart';
import 'package:view/features/websites/websites_list/websites_list_strings.dart';
import 'package:view/features/websites/websites_list/websites_list_strings_impl.dart';
import 'package:view/features/years/year_details/year_details_strings.dart';
import 'package:view/features/years/year_details/year_details_strings_impl.dart';
import 'package:view/features/years/years_list/years_list_strings.dart';
import 'package:view/features/years/years_list/years_list_strings_impl.dart';
import 'package:view/login/login_strings.dart';
import 'package:view/login/login_strings_impl.dart';
import 'package:view/widget/custom_table/custom_table_strings.dart';
import 'package:view/widget/custom_table/custom_table_strings_impl.dart';
import 'package:view/widget/page_header/page_header_strings.dart';
import 'package:view/widget/page_header/page_header_strings_impl.dart';

export 'package:view/features/cities/city_details/city_page.dart';
export 'package:view/features/cities/city_list/city_list_strings.dart';
export 'package:view/features/clients/clients_list/clients_page.dart';
export 'package:view/features/dashboard/dashboard_page.dart';
export 'package:view/features/users/user_details/user_page.dart';
export 'package:view/features/users/users_list/users_page.dart';
export 'package:view/features/websites/website_details/website_page.dart';
export 'package:view/features/websites/websites_list/websites_page.dart';
export 'package:view/features/years/year_details/year_page.dart';
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
    registerSingletonIfAbsent<PageHeaderStrings>(() => PageHeaderStringsImpl(inject));
    registerSingletonIfAbsent<CustomTableStrings>(() => CustomTableStringsImpl(inject));
    registerSingletonIfAbsent<DashboardStrings>(() => DashboardStringsImpl(inject));
    registerSingletonIfAbsent<UserDetailsStrings>(() => UserDetailsStringsImpl(inject));
    registerSingletonIfAbsent<UsersListStrings>(() => UsersListStringsImpl(inject));
    registerSingletonIfAbsent<ClientsListStrings>(() => ClientsListStringsImpl(inject));
    registerSingletonIfAbsent<YearsListStrings>(() => YearsListStringsImpl(inject));
    registerSingletonIfAbsent<YearDetailsStrings>(() => YearDetailsStringsImpl(inject));
    registerSingletonIfAbsent<WebsitesListStrings>(() => WebsitesListStringsImpl(inject));
    registerSingletonIfAbsent<WebsiteDetailsStrings>(() => WebsiteDetailsStringsImpl(inject));
    registerSingletonIfAbsent<CityListStrings>(() => CityListStringsImpl(inject));
    registerSingletonIfAbsent<CityDetailsStrings>(() => CityDetailsStringsImpl(inject));
  }
}
