part of '../router.dart';

class YearsPageRoute extends GoRouteData with $YearsPageRoute {
  const YearsPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return YearsPage(CustomRouter.instance.inject);
  }
}
