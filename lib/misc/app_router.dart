import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:linkhub/ui/analytics/widget.dart';
import 'package:linkhub/ui/dashboard/connector.dart';
import 'package:linkhub/ui/hub/connector.dart';
import 'package:linkhub/ui/hub/link_hub_widget.dart';
import 'package:linkhub/ui/main/widget.dart';
import 'package:linkhub/ui/new_hub/connector.dart';
import 'package:linkhub/ui/new_item/connector.dart';
import 'package:linkhub/ui/profile/widget.dart';
import 'package:linkhub/ui/sign/connector.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  // replaceInRouteName: 'Connector, Widget,',
  routes: <AutoRoute>[
    RedirectRoute(path: '/', redirectTo: '/sign'),
    CustomRoute(
      path: '/sign',
      initial: true,
      page: SignConnector,
      transitionsBuilder: fadeTransition,
      durationInMilliseconds: 400,
    ),
    CustomRoute(
      path: '/hubs/:hub',
      page: LinkHubWidget,
      transitionsBuilder: fadeTransition,
      durationInMilliseconds: 400,
    ),
    CustomRoute(
      path: '/main',
      page: MainWidget,
      guards: [AuthGuard],
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
          path: 'dashboard/hubs/new',
          opaque: false,
          page: NewHubConnector,
          transitionsBuilder: popupTransition,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          path: 'dashboard/hubs/:hub',
          page: HubConnector,
          transitionsBuilder: fadeTransition,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          path: 'dashboard/hubs/:hub/new-item',
          opaque: false,
          page: NewItemConnector,
          transitionsBuilder: popupTransition,
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
  AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required AuthGuard authGuard,
  }) : super(
          navigatorKey: navigatorKey,
          authGuard: authGuard,
        );
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    print(router.key);
    if (FirebaseAuth.instance.currentUser == null) {
      router.replaceNamed('/');
      resolver.next(false);
    } else {
      resolver.next(true);
    }
  }
}

Widget fadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) =>
    FadeTransition(opacity: animation, child: child);

Widget popupTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) =>
    FadeTransition(
      opacity: animation,
      child: Stack(
        children: [
          Container(
            color: Theme.of(context).focusColor,
          ),
          Center(
            child: Container(
              constraints: const BoxConstraints(
                minHeight: 256,
                minWidth: double.infinity,
                maxHeight: 400,
              ),
              child: Navigator(
                pages: [
                  MaterialPage(child: child),
                ],
              ),
            ),
          ),
        ],
      ),
    );
