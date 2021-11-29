import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:linkhub/core/model/data_status.dart';
import 'package:linkhub/core/redux/items/actions.dart';
import 'package:linkhub/core/redux/state.dart';

import 'widget.dart';

class NewItemConnector extends StatelessWidget {
  final String id;

  const NewItemConnector({
    Key? key,
    @PathParam('hub') required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, NewItemProps>(
        distinct: true,
        converter: (store) => NewItemProps(
          back: () => context.router.pop(),
          create: store.state.items.creating != DataStatus.inProgress
              ? (url) => store.dispatch(CreateItemAction(hubId: id, url: url))
              : null,
        ),
        builder: (context, props) => NewItemWidget(props: props),
      );
}
