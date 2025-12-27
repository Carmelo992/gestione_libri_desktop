import 'dart:async';

import 'package:view_model/cities/cities_view_model.dart';
import 'package:view_model/cities/cities_view_model_impl.dart';
import 'package:view_model/cities/city_details_view_model.dart';
import 'package:view_model/cities/city_details_view_model_impl.dart';
import 'package:view_model/clients/clients_view_model.dart';
import 'package:view_model/clients/clients_view_model_impl.dart';
import 'package:view_model/dashboard/dashboard_view_model.dart';
import 'package:view_model/dashboard/dashboard_view_model_impl.dart';
import 'package:view_model/login/login_view_model.dart';
import 'package:view_model/login/login_view_model_impl.dart';
import 'package:view_model/session/session_view_model.dart';
import 'package:view_model/session/session_view_model_impl.dart';
import 'package:view_model/users/user_details_view_model.dart';
import 'package:view_model/users/user_details_view_model_impl.dart';
import 'package:view_model/users/users_view_model.dart';
import 'package:view_model/users/users_view_model_impl.dart';
import 'package:view_model/web_sites/web_site_details_view_model.dart';
import 'package:view_model/web_sites/web_site_details_view_model_impl.dart';
import 'package:view_model/web_sites/web_sites_view_model.dart';
import 'package:view_model/web_sites/web_sites_view_model_impl.dart';
import 'package:view_model/years/year_details_view_model.dart';
import 'package:view_model/years/year_details_view_model_impl.dart';
import 'package:view_model/years/years_view_model.dart';
import 'package:view_model/years/years_view_model_impl.dart';

export 'package:view_model/cities/cities_view_model.dart';
export 'package:view_model/cities/city_details_view_model.dart';
export 'package:view_model/clients/clients_view_model.dart';
export 'package:view_model/dashboard/dashboard_view_model.dart';
export 'package:view_model/login/login_view_model.dart';
export 'package:view_model/session/session_view_model.dart';
export 'package:view_model/users/user_details_view_model.dart';
export 'package:view_model/users/users_view_model.dart';
export 'package:view_model/web_sites/web_site_details_view_model.dart';
export 'package:view_model/web_sites/web_sites_view_model.dart';
export 'package:view_model/years/years_view_model.dart';

class ViewModel {
  static void inject({
    required Function<T extends Object>(
      T Function() factoryFunc, {
      String? instanceName,
      FutureOr Function(T param)? dispose,
      bool useWeakReference,
    })
    registerLazySingleton,
    required T Function<T extends Object>() inject,
  }) {}

  static void scopePushed({
    required String scope,
    required Function<T extends Object>(
      T Function() factoryFunc, {
      String? instanceName,
      FutureOr Function(T param)? dispose,
      bool useWeakReference,
    })
    registerLazySingleton,
    required T Function<T extends Object>() inject,
  }) {
    if (scope.startsWith("session")) {
      registerLazySingleton<SessionViewModel>(() => SessionViewModelImpl(inject));
      registerLazySingleton<DashboardViewModel>(() => DashboardViewModelImpl(inject));
      registerLazySingleton<ClientsViewModel>(() => ClientsViewModelImpl(inject));
      registerLazySingleton<UsersViewModel>(() => UsersViewModelImpl(inject));
      registerLazySingleton<UserDetailsViewModel>(() => UserDetailsViewModelImpl(inject));
      registerLazySingleton<YearsViewModel>(() => YearsViewModelImpl(inject: inject));
      registerLazySingleton<YearDetailsViewModel>(() => YearDetailsViewModelImpl(inject: inject));
      registerLazySingleton<WebSitesViewModel>(() => WebSitesViewModelImpl(inject: inject));
      registerLazySingleton<WebSiteDetailsViewModel>(() => WebSiteDetailsViewModelImpl(inject: inject));
      registerLazySingleton<CitiesViewModel>(() => CitiesViewModelImpl(inject: inject));
      registerLazySingleton<CityDetailsViewModel>(() => CityDetailsViewModelImpl(inject: inject));
    }
    if (scope.startsWith("noSession")) {
      registerLazySingleton<LoginViewModel>(() => LoginViewModelImpl(inject));
    }
  }
}
