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
    Sign.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SignConnector());
    },
    Main.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const MainConnector());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/sign', fullMatch: true),
        RouteConfig(Sign.name, path: '/sign'),
        RouteConfig(Main.name, path: '/main')
      ];
}

/// generated route for [SignConnector]
class Sign extends PageRouteInfo<void> {
  const Sign() : super(name, path: '/sign');

  static const String name = 'Sign';
}

/// generated route for [MainConnector]
class Main extends PageRouteInfo<void> {
  const Main() : super(name, path: '/main');

  static const String name = 'Main';
}
