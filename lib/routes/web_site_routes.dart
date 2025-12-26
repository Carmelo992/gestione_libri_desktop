part of '../router.dart';

class WebSitesPageRoute extends GoRouteData with $WebSitesPageRoute {
  const WebSitesPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WebsitesPage(CustomRouter.instance.inject, openDetails: (id) => WebSitePageRoute(webSiteId: id).go(context));
  }
}

class WebSitePageRoute extends GoRouteData with $WebSitePageRoute {
  const WebSitePageRoute({required this.webSiteId});

  final String webSiteId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WebSitePage(CustomRouter.instance.inject, websiteId: webSiteId);
  }
}
