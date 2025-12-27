part of '../router.dart';

class CitiesPageRoute extends GoRouteData with $CitiesPageRoute {
  const CitiesPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CitiesPage(CustomRouter.instance.inject, openDetails: (id) => CityPageRoute(cityId: id).go(context));
  }
}

class CityPageRoute extends GoRouteData with $CityPageRoute {
  const CityPageRoute({required this.cityId});

  final String cityId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CityPage(CustomRouter.instance.inject, cityId: cityId);
  }
}
