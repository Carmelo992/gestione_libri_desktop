import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:model/model.dart';
import 'package:view/view.dart';

part 'router.g.dart';
part 'routes/client_routes.dart';
part 'routes/dashboard_routes.dart';
part 'routes/main_route.dart';
part 'routes/user_routes.dart';
part 'routes/year_routes.dart';
part 'routes/web_site_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

class CustomRouter {
  static CustomRouter? _instance;

  static CustomRouter get instance {
    if (_instance == null) {
      throw "CustomRouter not initialized. Call initialize method before require an instance";
    }
    return _instance!;
  }

  static CustomRouter initialize({
    String? initialLocation,
    Function(String route)? routeListener,

    required void Function(String name) pushScope,
    required void Function(String name) popScope,
    required T Function<T extends Object>({String? instanceName}) inject,
  }) {
    _instance ??= CustomRouter._(
      initialLocation: initialLocation,
      routeListener: routeListener,
      inject: inject,
      pushScope: pushScope,
      popScope: popScope,
    );
    return _instance!;
  }

  T inject<T extends Object>({String? instanceName}) => _inject<T>(instanceName: instanceName);
  final Function<T extends Object>({String? instanceName}) _inject;

  String? initialLocation;

  late GoRouter router;

  void Function(String name)? pushScope;
  void Function(String name)? popScope;

  CustomRouter._({
    required T Function<T extends Object>({String? instanceName}) inject,
    this.initialLocation,
    required this.pushScope,
    required this.popScope,
    Function(String route)? routeListener,
  }) : _inject = inject {
    router = GoRouter(
      routes: $appRoutes,
      debugLogDiagnostics: kDebugMode,
      navigatorKey: _rootNavigatorKey,
      refreshListenable: inject<SessionService>().session,
      redirect: (context, state) {
        bool userLogged = inject<SessionService>().session.value != null;
        if (userLogged && state.uri.toString().contains("login")) {
          return DashboardRoute().location;
        }
        if (!userLogged && !state.uri.toString().contains("login")) {
          return AccessRouteData().location;
        }
        return null;
      },
    );
  }
}

@TypedGoRoute<AccessRouteData>(path: '/login')
class AccessRouteData extends GoRouteData with $AccessRouteData {
  AccessRouteData() {
    CustomRouter.instance.popScope?.call("session");
    CustomRouter.instance.pushScope?.call("noSession");
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginPage(CustomRouter.instance.inject);
  }

  @override
  FutureOr<bool> onExit(BuildContext context, GoRouterState state) {
    CustomRouter.instance.popScope?.call("noSession");

    return true;
  }
}
