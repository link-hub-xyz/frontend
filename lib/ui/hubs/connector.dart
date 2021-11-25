import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:linkhub/core/model/data_status.dart';
import 'package:linkhub/core/redux/auth/actions.dart';
import 'package:linkhub/core/redux/hubs/actions.dart';
import 'package:linkhub/core/redux/state.dart';
import 'package:linkhub/misc/app_router.dart';

import 'widget.dart';

class HubsConnector extends StatelessWidget {
  const HubsConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, HubsProps>(
        distinct: true,
        onInitialBuild: (props) {
          final reload = props.reload;
          if (reload != null) reload();
        },
        converter: (store) => HubsProps(
          signOut: () => store.dispatch(const SignOutAction()),
          reload: store.state.hubs.status == DataStatus.inProgress
              ? null
              : () => store.dispatch(const ReloadHubsAction()),
          hubs: store.state.hubs.list,
          more: (id) => context.pushRoute(const ItemWidgetRoute()),
        ),
        builder: (context, props) => HubsWidget(props: props),
      );
}
