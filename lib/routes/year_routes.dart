part of '../router.dart';

class YearsPageRoute extends GoRouteData with $YearsPageRoute {
  const YearsPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return YearsPage(CustomRouter.instance.inject, openDetails: (id) => YearPageRoute(yearId: id).go(context));
  }
}

class YearPageRoute extends GoRouteData with $YearPageRoute {
  const YearPageRoute({required this.yearId});

  final String yearId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return YearPage(CustomRouter.instance.inject, yearId: yearId);
  }
}
