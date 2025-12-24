part of '../router.dart';

@TypedStatefulShellRoute<ShellRouteData>(
  branches: [
    TypedStatefulShellBranch(routes: [TypedGoRoute<DashboardRoute>(path: '/')]),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<UsersPageRoute>(
          path: '/users',
          routes: [TypedGoRoute<UserPageRoute>(path: ':userId')],
        ),
      ],
    ),
    TypedStatefulShellBranch(routes: [TypedGoRoute<ClientsPageRoute>(path: '/clients')]),
    TypedStatefulShellBranch(routes: [TypedGoRoute<YearsPageRoute>(path: '/years')]),
  ],
)
class ShellRouteData extends StatefulShellRouteData {
  ShellRouteData() {
    CustomRouter.instance.pushScope?.call("session");
  }

  @override
  Widget builder(BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
    return SelectionArea(
      child: ScaffoldWithNavigation(
        CustomRouter.instance.inject,
        navigationShell: navigationShell,
        openDashboard: () => const DashboardRoute().go(context),
      ),
    );
  }
}
