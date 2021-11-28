import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:linkhub/core/redux/hubs/actions.dart';
import 'package:linkhub/core/redux/state.dart';

import 'widget.dart';

class HubConnector extends StatelessWidget {
  final String id;

  const HubConnector({
    Key? key,
    @PathParam('hub') required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, HubProps>(
        distinct: true,
        onInit: (store) => {
          store.dispatch(DownloadHubAction(id: id)),
          FirebaseAnalytics().logViewItem(
            itemId: id,
            itemName: '',
            itemCategory: 'hub',
          ),
        },
        converter: (store) => HubProps(
          hub: store.state.hubs.map[id],
          status: store.state.hubs.downloadStatus,
        ),
        builder: (context, props) => HubWidget(props: props),
      );
}
