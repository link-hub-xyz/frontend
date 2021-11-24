import 'package:redux/redux.dart';

class LoggingMiddleware extends MiddlewareClass {
  LoggingMiddleware();

  @override
  call(Store store, action, NextDispatcher next) {
    next(action);
    print('${action.runtimeType} = ${action.toString()}');
  }

  // @override
  // void call<State>(Store<State> store, action, next) async {
  // next(action);

  // print('${action.runtimeType} = ${action.toString()}');
  // }
}
