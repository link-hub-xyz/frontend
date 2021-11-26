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
    MainWidgetRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const MainWidget(),
          transitionsBuilder: fadeTransition,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    DashboardConnectorRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const DashboardConnector(),
          transitionsBuilder: fadeTransition,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    HubConnectorRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<HubConnectorRouteArgs>(
          orElse: () => HubConnectorRouteArgs(id: pathParams.getString('hub')));
      return CustomPage<dynamic>(
          routeData: routeData,
          child: HubConnector(key: args.key, id: args.id),
          transitionsBuilder: fadeTransition,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    AnalyticsWidgetRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const AnalyticsWidget(),
          transitionsBuilder: fadeTransition,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileWidgetRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const ProfileWidget(),
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
        RouteConfig(MainWidgetRoute.name, path: '/main', children: [
          RouteConfig('#redirect',
              path: '',
              parent: MainWidgetRoute.name,
              redirectTo: 'dashboard',
              fullMatch: true),
          RouteConfig(DashboardConnectorRoute.name,
              path: 'dashboard', parent: MainWidgetRoute.name),
          RouteConfig(HubConnectorRoute.name,
              path: 'dashboard/hubs/:hub', parent: MainWidgetRoute.name),
          RouteConfig(AnalyticsWidgetRoute.name,
              path: 'analytics', parent: MainWidgetRoute.name),
          RouteConfig(ProfileWidgetRoute.name,
              path: 'profile', parent: MainWidgetRoute.name)
        ])
      ];
}

/// generated route for [SignConnector]
class SignConnectorRoute extends PageRouteInfo<void> {
  const SignConnectorRoute() : super(name, path: '/sign');

  static const String name = 'SignConnectorRoute';
}

/// generated route for [MainWidget]
class MainWidgetRoute extends PageRouteInfo<void> {
  const MainWidgetRoute({List<PageRouteInfo>? children})
      : super(name, path: '/main', initialChildren: children);

  static const String name = 'MainWidgetRoute';
}

/// generated route for [DashboardConnector]
class DashboardConnectorRoute extends PageRouteInfo<void> {
  const DashboardConnectorRoute() : super(name, path: 'dashboard');

  static const String name = 'DashboardConnectorRoute';
}

/// generated route for [HubConnector]
class HubConnectorRoute extends PageRouteInfo<HubConnectorRouteArgs> {
  HubConnectorRoute({Key? key, required String id})
      : super(name,
            path: 'dashboard/hubs/:hub',
            args: HubConnectorRouteArgs(key: key, id: id),
            rawPathParams: {'hub': id});

  static const String name = 'HubConnectorRoute';
}

class HubConnectorRouteArgs {
  const HubConnectorRouteArgs({this.key, required this.id});

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'HubConnectorRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for [AnalyticsWidget]
class AnalyticsWidgetRoute extends PageRouteInfo<void> {
  const AnalyticsWidgetRoute() : super(name, path: 'analytics');

  static const String name = 'AnalyticsWidgetRoute';
}

/// generated route for [ProfileWidget]
class ProfileWidgetRoute extends PageRouteInfo<void> {
  const ProfileWidgetRoute() : super(name, path: 'profile');

  static const String name = 'ProfileWidgetRoute';
}
