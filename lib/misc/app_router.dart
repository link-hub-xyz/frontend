import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:linkhub/ui/main/connector.dart';
import 'package:linkhub/ui/sign/connector.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Connector,',
  routes: <AutoRoute>[
    AutoRoute(path: '/sign', page: SignConnector, initial: true),
    AutoRoute(path: '/main', page: MainConnector),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);
}
