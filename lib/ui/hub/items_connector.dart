import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:linkhub/core/redux/state.dart';
import 'package:linkhub/misc/app_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;
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
          create: store.state.auth.id == store.state.hubs.map[id]?.creator
              ? () => context.router.push(NewItemConnectorRoute(id: id))
              : null,
          onPressed: (id) async {
            final url = store.state.items.map[id]?.url;
            if (url != null) {
              FirebaseAnalytics().logViewItem(
                itemId: id,
                itemName: url,
                itemCategory: 'item',
              );

              // var response = await http.get(Uri.parse(url), headers: {
              //   'Authorization':
              //       await FirebaseAuth.instance.currentUser?.getIdToken() ?? '',
              // });

              // html.window.open(
              //   Uri.dataFromString(
              //     response.body,
              //     mimeType: 'text/html',
              //   ).toString(),
              //   'popup',
              // );
              // //         fetch(url, {/*YOUR CUSTOM HEADER*/} ) // FETCH BLOB FROM IT
              // //   .then((response) => response.blob())
              // //   .then((blob) => { // RETRIEVE THE BLOB AND CREATE LOCAL URL
              // //     var _url = window.URL.createObjectURL(blob);
              // //     window.open(_url, "_blank").focus(); // window.open + focus
              // // }).catch((err) => {
              // //   console.log(err);
              // // });

              var uri = Uri.parse(url);
              var token = await FirebaseAuth.instance.currentUser?.getIdToken();
              var authParams = {'link-hub-token': token};

              switch (uri.scheme) {
                case 'http':
                  launch(
                    Uri.http(
                      uri.host,
                      uri.path,
                      Map.from(uri.queryParameters)..addAll(authParams),
                    ).toString(),
                    forceSafariVC: false,
                  );
                  break;

                case 'https':
                  launch(
                    Uri.https(
                      uri.host,
                      uri.path,
                      Map.from(uri.queryParameters)..addAll(authParams),
                    ).toString(),
                    forceSafariVC: false,
                  );
                  break;

                default:
                  launch(
                    url,
                    forceSafariVC: false,
                  );
                  break;
              }
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
