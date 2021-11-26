import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:linkhub/ui/analytics/widget.dart';
import 'package:linkhub/ui/dashboard/connector.dart';
import 'package:linkhub/ui/hub/connector.dart';
import 'package:linkhub/ui/main/widget.dart';
import 'package:linkhub/ui/profile/widget.dart';
import 'package:linkhub/ui/sign/connector.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  // replaceInRouteName: 'Connector, Widget,',
  routes: <AutoRoute>[
    CustomRoute(
      path: '/sign',
      initial: true,
      page: SignConnector,
      transitionsBuilder: fadeTransition,
      durationInMilliseconds: 400,
    ),
    CustomRoute(
      path: '/main',
      page: MainWidget,
      transitionsBuilder: fadeTransition,
      durationInMilliseconds: 400,
      children: [
        CustomRoute(
          path: 'dashboard',
          initial: true,
          page: DashboardConnector,
          transitionsBuilder: fadeTransition,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          path: 'dashboard/hubs/:hub',
          page: HubConnector,
          transitionsBuilder: fadeTransition,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          path: 'analytics',
          page: AnalyticsWidget,
          transitionsBuilder: fadeTransition,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          path: 'profile',
          page: ProfileWidget,
          transitionsBuilder: fadeTransition,
          durationInMilliseconds: 400,
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);
}

Widget fadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) =>
    FadeTransition(opacity: animation, child: child);
