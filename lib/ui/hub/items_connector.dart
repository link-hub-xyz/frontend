import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:linkhub/core/redux/state.dart';
import 'package:url_launcher/url_launcher.dart';

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
          onPressed: (id) {
            final url = store.state.items.map[id]?.url;
            // TODO: add requester id for analytics.
            if (url != null) {
              FirebaseAnalytics().logViewItem(
                itemId: id,
                itemName: url,
                itemCategory: 'item',
              );
              launch(
                url,
                forceSafariVC: false,
              );
            }
          },
          items: store.state.hubs.map[id]?.items
                  .map((id) => store.state.items.map[id])
                  .whereType() ??
              [],
        ),
        builder: (context, props) => ItemsListWidget(props: props),
      );
}
