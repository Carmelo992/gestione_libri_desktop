part of '../router.dart';

class UsersPageRoute extends GoRouteData with $UsersPageRoute {
  const UsersPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UsersPage(CustomRouter.instance.inject, openDetails: (id) => UserPageRoute(userId: id).go(context));
  }
}

class UserPageRoute extends GoRouteData with $UserPageRoute {
  const UserPageRoute({required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UserPage(CustomRouter.instance.inject, userId: userId);
  }
}
