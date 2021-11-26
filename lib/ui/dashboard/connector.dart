import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:linkhub/core/model/data_status.dart';
import 'package:linkhub/core/redux/hubs/actions.dart';
import 'package:linkhub/core/redux/state.dart';
import 'package:linkhub/misc/app_router.dart';

import 'widget.dart';

class DashboardConnector extends StatelessWidget {
  const DashboardConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, DashboardProps>(
        distinct: true,
        onInitialBuild: (props) {
          final reload = props.reload;
          if (reload != null) reload();
        },
        converter: (store) => DashboardProps(
          reload: store.state.hubs.status == DataStatus.inProgress
              ? null
              : () => store.dispatch(const ReloadHubsAction()),
          hubs: store.state.hubs.list,
          more: (id) => context.router.push(const ItemWidgetRoute()),
        ),
        builder: (context, props) => DashboardWidget(props: props),
      );
}
