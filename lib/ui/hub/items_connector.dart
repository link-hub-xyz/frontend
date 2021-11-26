import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:linkhub/core/redux/state.dart';

import 'items_widget.dart';

class ItemsConnector extends StatelessWidget {
  final String id;

  const ItemsConnector({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, ItemsListProps>(
        distinct: true,
        converter: (store) => ItemsListProps(
          items: store.state.hubs.map[id]?.items
                  .map((id) => store.state.items.map[id])
                  .whereType() ??
              [],
        ),
        builder: (context, props) => ItemsListWidget(props: props),
      );
}
