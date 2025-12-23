part of '../router.dart';

class ClientsPageRoute extends GoRouteData with $ClientsPageRoute {
  const ClientsPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ClientsPage(CustomRouter.instance.inject);
  }
}
