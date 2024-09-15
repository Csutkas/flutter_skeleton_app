import 'package:auto_route/auto_route.dart';
import 'package:flutter_app/navigator/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        // HomeScreen is generated as HomeRoute because
        // of the replaceInRouteName property
        AutoRoute(
          page: DashboardRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        ..._authenticationRoutes,
        ..._profileRoutes
      ];
  List<AutoRoute> get _authenticationRoutes => [
        AutoRoute(
          page: LoginRoute.page,
          initial: true,
        ),
      ];
  List<AutoRoute> get _profileRoutes => [
        AutoRoute(page: ProfileEditRoute.page),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
