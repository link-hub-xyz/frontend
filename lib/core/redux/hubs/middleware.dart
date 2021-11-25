import 'dart:io';
import 'package:artemis/artemis.dart';
import 'package:get_it/get_it.dart';
import 'package:linkhub/core/model/hub.dart';
import 'package:linkhub/core/redux/hubs/actions.dart';
import 'package:linkhub/core/api/api.graphql.dart';
import 'package:redux/redux.dart';

import '../state.dart';
import 'package:gql_link/gql_link.dart' as gql;

final List<Middleware<AppState>> hubsMiddlewares = [
  TypedMiddleware<AppState, ReloadHubsAction>(_reloadHubs),
];

void _reloadHubs(
  Store<AppState> store,
  ReloadHubsAction action,
  NextDispatcher next,
) async {
  next(action);
  final client = GetIt.instance.get<ArtemisClient>();
  try {
    final response = await client.execute(MyHubsQuery());
    if (response.errors?.isNotEmpty == true) {
      next(DidFailReloadHubsAction(reason: response.errors.toString()));
    }

    final data = response.data;
    if (data != null) {
      next(
        DidReloadHubsAction(
          hubs:
              data.users?.me?.hubs.map((raw) => Hub(id: raw.id)).toList() ?? [],
        ),
      );
    }
  } on gql.ServerException catch (e) {
    switch (e.originalException.runtimeType) {
      case SocketException:
        next(const DidFailReloadHubsAction(reason: 'No internet connection.'));
        return;
      default:
        next(const DidFailReloadHubsAction(reason: 'Smth went wrong.'));
    }
  } catch (_) {
    next(const DidFailReloadHubsAction(reason: 'Smth went wrong.'));
  }
}
