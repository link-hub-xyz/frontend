import 'package:redux/redux.dart';
import 'alert_middleware.dart';
import 'auth/middleware.dart';
import 'hubs/middleware.dart';
import 'items/middleware.dart';
import 'logging_middleware.dart';
import 'navigation_middleware.dart';
import 'state.dart';

final List<Middleware<AppState>> appMiddleware = authMiddlewares +
    hubsMiddlewares +
    itemsMiddlewares +
    [
      failureMiddleware,
      LoggingMiddleware(),
      NavigationMiddleware(),
    ];
