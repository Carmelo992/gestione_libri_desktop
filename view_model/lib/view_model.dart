import 'dart:async';

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

export 'package:view_model/clients/clients_view_model.dart';
export 'package:view_model/dashboard/dashboard_view_model.dart';
export 'package:view_model/login/login_view_model.dart';
export 'package:view_model/session/session_view_model.dart';
export 'package:view_model/users/user_details_view_model.dart';
export 'package:view_model/users/users_view_model.dart';

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
      registerLazySingleton<DashboardViewModel>(() => DashboardViewModelImpl(inject));
      registerLazySingleton<ClientsViewModel>(() => ClientsViewModelImpl(inject));
      registerLazySingleton<UsersViewModel>(() => UsersViewModelImpl(inject));
      registerLazySingleton<UserDetailsViewModel>(() => UserDetailsViewModelImpl(inject));
      registerLazySingleton<SessionViewModel>(() => SessionViewModelImpl(inject));
    }
    if (scope.startsWith("noSession")) {
      registerLazySingleton<LoginViewModel>(() => LoginViewModelImpl(inject));
    }
  }
}
