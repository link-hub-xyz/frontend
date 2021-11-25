import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:linkhub/ui/main/connector.dart';
import 'package:linkhub/ui/sign/connector.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Connector,',
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
      page: MainConnector,
      transitionsBuilder: fadeTransition,
      durationInMilliseconds: 400,
    )
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
