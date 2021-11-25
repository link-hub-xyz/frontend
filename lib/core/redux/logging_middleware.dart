import 'package:redux/redux.dart';

class LoggingMiddleware extends MiddlewareClass {
  LoggingMiddleware();

  @override
  call(Store store, action, NextDispatcher next) {
    next(action);
    print('${action.runtimeType} = ${action.toString()}');
  }
}
