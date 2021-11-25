import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:linkhub/ui/dashboard/widget.dart';
import 'package:linkhub/ui/hubs/connector.dart';
import 'package:linkhub/ui/item/widget.dart';
import 'package:linkhub/ui/sign/connector.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Connector, Widget,',
  routes: <AutoRoute>[
    CustomRoute(
      path: '/sign',
      initial: true,
      page: SignConnector,
      transitionsBuilder: fadeTransition,
      durationInMilliseconds: 400,
    ),
    CustomRoute(
        path: '/dashboard',
        page: DashboardWidget,
        transitionsBuilder: fadeTransition,
        durationInMilliseconds: 400,
        children: [
          MaterialRoute(
            path: '',
            page: HubsConnector,
          ),
          CustomRoute(
            path: 'item',
            page: ItemWidget,
            transitionsBuilder: fadeTransition,
            durationInMilliseconds: 400,
          ),
          RedirectRoute(path: '*', redirectTo: ''),
        ])
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
