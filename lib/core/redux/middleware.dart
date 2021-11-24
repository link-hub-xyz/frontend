import 'package:redux/redux.dart';
import 'auth/middleware.dart';
import 'logging_middleware.dart';
import 'navigation_middleware.dart';
import 'state.dart';

final List<Middleware<AppState>> appMiddleware = authMiddlewares +
    [
      LoggingMiddleware(),
      NavigationMiddleware(),
    ];
