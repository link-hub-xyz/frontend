import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:linkhub/core/model/data_status.dart';
import 'package:linkhub/core/redux/hubs/actions.dart';
import 'package:linkhub/core/redux/state.dart';

import 'widget.dart';

class NewHubConnector extends StatelessWidget {
  const NewHubConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, NewHubProps>(
        distinct: true,
        converter: (store) => NewHubProps(
          back: () => context.router.pop(),
          create: store.state.hubs.creationStatus != DataStatus.inProgress
              ? (name) => store.dispatch(CreateHubAction(name: name))
              : null,
        ),
        builder: (context, props) => NewHubWidget(props: props),
      );
}
