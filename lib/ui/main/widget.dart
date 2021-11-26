import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:linkhub/misc/app_config.dart';
import 'package:linkhub/ui/side/connector.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(color: ThemeData.dark().scaffoldBackgroundColor),
          Row(
            children: [
              Theme(
                data: ThemeData.dark().copyWith(
                  colorScheme: Theme.of(context).colorScheme,
                  appBarTheme: ThemeData.dark().appBarTheme.copyWith(
                        backgroundColor:
                            ThemeData.dark().scaffoldBackgroundColor,
                      ),
                ),
                child: const SideConnector(),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                  ),
                  child: AutoRouter(
                    navigatorObservers: () => [
                      GetIt.instance.get<AppNavigationObserver>(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}
