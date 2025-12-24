import 'dart:async';

import 'package:model/auth/auth_service.dart';
import 'package:model/auth/auth_service_impl.dart';
import 'package:model/clients/client_service.dart';
import 'package:model/clients/client_service_impl.dart';
import 'package:model/session/session_service.dart';
import 'package:model/session/session_service_impl.dart';
import 'package:model/users/user_service.dart';
import 'package:model/users/user_service_impl.dart';
import 'package:model/years/year_service.dart';
import 'package:model/years/year_service_impl.dart';

export 'package:model/auth/auth_service.dart';
export 'package:model/clients/client_model.dart';
export 'package:model/clients/client_service.dart';
export 'package:model/session/session_service.dart';
export 'package:model/users/user_model.dart';
export 'package:model/users/user_service.dart';
export 'package:model/years/year_model.dart';
export 'package:model/years/year_service.dart';

class Model {
  static void inject({
    required Function<T extends Object>(
      T Function() factoryFunc, {
      String? instanceName,
      FutureOr Function(T param)? dispose,
      bool useWeakReference,
    })
    registerLazySingleton,
    required T Function<T extends Object>({String? instanceName}) inject,
  }) {
    registerLazySingleton<SessionService>(() => SessionServiceImpl());
    registerLazySingleton<AuthService>(() => AuthServiceImpl(inject));
    registerLazySingleton<UserService>(() => UserServiceImpl(inject));
    registerLazySingleton<ClientService>(() => ClientServiceImpl(inject));
    registerLazySingleton<YearService>(() => YearServiceImpl(inject));
  }
}
