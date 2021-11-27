// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter(
      {GlobalKey<NavigatorState>? navigatorKey, required this.authGuard})
      : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    SignConnectorRoute.name: (routeData) {
      final args = routeData.argsAs<SignConnectorRouteArgs>(
          orElse: () => const SignConnectorRouteArgs());
      return CustomPage<dynamic>(
          routeData: routeData,
          child: SignConnector(key: args.key),
          transitionsBuilder: fadeTransition,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    LinkHubWidgetRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<LinkHubWidgetRouteArgs>(
          orElse: () =>
              LinkHubWidgetRouteArgs(id: pathParams.getString('hub')));
      return CustomPage<dynamic>(
          routeData: routeData,
          child: LinkHubWidget(key: args.key, id: args.id),
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
    NewHubConnectorRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const NewHubConnector(),
          transitionsBuilder: popupTransition,
          durationInMilliseconds: 400,
          opaque: false,
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
        RouteConfig(LinkHubWidgetRoute.name, path: '/hubs/:hub'),
        RouteConfig(MainWidgetRoute.name, path: '/main', guards: [
          authGuard
        ], children: [
          RouteConfig('#redirect',
              path: '',
              parent: MainWidgetRoute.name,
              redirectTo: 'dashboard',
              fullMatch: true),
          RouteConfig(DashboardConnectorRoute.name,
              path: 'dashboard', parent: MainWidgetRoute.name),
          RouteConfig(NewHubConnectorRoute.name,
              path: 'dashboard/hubs/new', parent: MainWidgetRoute.name),
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
class SignConnectorRoute extends PageRouteInfo<SignConnectorRouteArgs> {
  SignConnectorRoute({Key? key})
      : super(name, path: '/sign', args: SignConnectorRouteArgs(key: key));

  static const String name = 'SignConnectorRoute';
}

class SignConnectorRouteArgs {
  const SignConnectorRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SignConnectorRouteArgs{key: $key}';
  }
}

/// generated route for [LinkHubWidget]
class LinkHubWidgetRoute extends PageRouteInfo<LinkHubWidgetRouteArgs> {
  LinkHubWidgetRoute({Key? key, required String id})
      : super(name,
            path: '/hubs/:hub',
            args: LinkHubWidgetRouteArgs(key: key, id: id),
            rawPathParams: {'hub': id});

  static const String name = 'LinkHubWidgetRoute';
}

class LinkHubWidgetRouteArgs {
  const LinkHubWidgetRouteArgs({this.key, required this.id});

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'LinkHubWidgetRouteArgs{key: $key, id: $id}';
  }
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

/// generated route for [NewHubConnector]
class NewHubConnectorRoute extends PageRouteInfo<void> {
  const NewHubConnectorRoute() : super(name, path: 'dashboard/hubs/new');

  static const String name = 'NewHubConnectorRoute';
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
