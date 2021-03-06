import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:linkhub/misc/app_router.dart';
import 'package:linkhub/misc/router_assembler.dart';
import 'package:redux/redux.dart';

import 'actions.dart';
import 'auth/actions.dart';
import 'hubs/actions.dart';
import 'items/actions.dart';

class NavigationMiddleware extends MiddlewareClass {
  @override
  call(Store store, action, NextDispatcher next) {
    next(action);

    final context = navigatorKey.currentContext;
    if (context != null) {
      switch (action.runtimeType) {
        case FailureAction:
        case AlertAction:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(action.reason),
              behavior: SnackBarBehavior.floating,
              width: 256,
            ),
          );
          break;

        case DidCreateHubAction:
          context.router.replace(const DashboardConnectorRoute());
          break;

        case DidCreateItemAction:
          context.router.replace(HubConnectorRoute(id: action.id));
          break;

        case SignOutAction:
          context.router.replaceNamed('/');
          break;
      }
    }
  }
}
