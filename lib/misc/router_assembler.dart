import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:linkhub/core/service/assembler.dart';

import 'app_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class RouterAssembler implements Assebmbler {
  @override
  Future assemble(GetIt locator) {
    locator.registerSingleton<AppRouter>(AppRouter(
      navigatorKey: navigatorKey,
      authGuard: AuthGuard(),
    ));
    return Future.value();
  }
}
