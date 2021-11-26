import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:linkhub/core/model/data_status.dart';
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
        converter: (store) {
          return HubProps(
            hub: store.state.hubs.map[id],
            status: DataStatus.initial,
          );
        },
        builder: (context, props) => HubWidget(props: props),
      );
}
