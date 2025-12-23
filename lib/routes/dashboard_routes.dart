part of '../router.dart';

class DashboardRoute extends GoRouteData with $DashboardRoute {
  const DashboardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DashBoardPage(CustomRouter.instance.inject);
  }
}
