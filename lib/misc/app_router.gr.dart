// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SignConnectorRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SignConnector(),
          transitionsBuilder: fadeTransition,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    DashboardWidgetRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const DashboardWidget(),
          transitionsBuilder: fadeTransition,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    HubsConnectorRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HubsConnector());
    },
    ItemWidgetRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const ItemWidget(),
          transitionsBuilder: fadeTransition,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/sign', fullMatch: true),
        RouteConfig(SignConnectorRoute.name, path: '/sign'),
        RouteConfig(DashboardWidgetRoute.name, path: '/dashboard', children: [
          RouteConfig(HubsConnectorRoute.name,
              path: '', parent: DashboardWidgetRoute.name),
          RouteConfig(ItemWidgetRoute.name,
              path: 'item', parent: DashboardWidgetRoute.name),
          RouteConfig('*#redirect',
              path: '*',
              parent: DashboardWidgetRoute.name,
              redirectTo: '',
              fullMatch: true)
        ])
      ];
}

/// generated route for [SignConnector]
class SignConnectorRoute extends PageRouteInfo<void> {
  const SignConnectorRoute() : super(name, path: '/sign');

  static const String name = 'SignConnectorRoute';
}

/// generated route for [DashboardWidget]
class DashboardWidgetRoute extends PageRouteInfo<void> {
  const DashboardWidgetRoute({List<PageRouteInfo>? children})
      : super(name, path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardWidgetRoute';
}

/// generated route for [HubsConnector]
class HubsConnectorRoute extends PageRouteInfo<void> {
  const HubsConnectorRoute() : super(name, path: '');

  static const String name = 'HubsConnectorRoute';
}

/// generated route for [ItemWidget]
class ItemWidgetRoute extends PageRouteInfo<void> {
  const ItemWidgetRoute() : super(name, path: 'item');

  static const String name = 'ItemWidgetRoute';
}
