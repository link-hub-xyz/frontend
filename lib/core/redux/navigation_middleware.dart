import 'package:flutter/material.dart';
import 'package:linkhub/misc/app_config.dart';
import 'package:redux/redux.dart';

import 'actions.dart';

class NavigationMiddleware extends MiddlewareClass {
  @override
  call(Store store, action, NextDispatcher next) {
    next(action);
    switch (action.runtimeType) {
      case AlertAction:
        final context = navigatorKey.currentContext;
        if (context != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(action.reason),
              behavior: SnackBarBehavior.floating,
              width: 256,
            ),
          );
        }

        break;
    }
  }
}
