import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:linkhub/core/redux/auth/actions.dart';
import 'package:linkhub/core/redux/state.dart';
import 'package:linkhub/misc/app_config.dart';
import 'package:linkhub/misc/app_router.dart';

import 'widget.dart';

class SideConnector extends StatefulWidget {
  const SideConnector({
    Key? key,
  }) : super(key: key);

  @override
  State<SideConnector> createState() => _SideConnectorState();
}

class _SideConnectorState extends State<SideConnector> {
  @override
  Widget build(BuildContext context) => StoreConnector<AppState, SideProps>(
        converter: (store) => SideProps(
          dashboard: GetIt.instance.get<AppNavigationObserver>().currentRoute !=
                  DashboardConnectorRoute.name
              ? () {
                  context.router.replaceAll([const DashboardConnectorRoute()]);
                  setState(() {});
                }
              : null,
          analytics: GetIt.instance.get<AppNavigationObserver>().currentRoute !=
                  AnalyticsWidgetRoute.name
              ? () {
                  context.router.replaceAll([const AnalyticsWidgetRoute()]);
                  setState(() {});
                }
              : null,
          profile: GetIt.instance.get<AppNavigationObserver>().currentRoute !=
                  ProfileWidgetRoute.name
              ? () {
                  context.router.replaceAll([const ProfileWidgetRoute()]);
                  setState(() {});
                }
              : null,
          signOut: () => store.dispatch(
            const SignOutAction(),
          ),
        ),
        builder: (context, props) => SideWidget(props: props),
      );
}
