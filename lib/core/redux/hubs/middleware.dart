import 'dart:io';
import 'package:artemis/artemis.dart';
import 'package:get_it/get_it.dart';
import 'package:linkhub/core/model/hub.dart';
import 'package:linkhub/core/model/item.dart';
import 'package:linkhub/core/redux/hubs/actions.dart';
import 'package:linkhub/core/api/api.graphql.dart';
import 'package:redux/redux.dart';

import '../state.dart';
import 'package:gql_link/gql_link.dart' as gql;

final List<Middleware<AppState>> hubsMiddlewares = [
  TypedMiddleware<AppState, ReloadHubsAction>(_reloadHubs),
  TypedMiddleware<AppState, CreateHubAction>(_createHub),
];

void _reloadHubs(
  Store<AppState> store,
  ReloadHubsAction action,
  NextDispatcher next,
) async {
  next(action);
  next(const ReloadingHubsAction());
  final client = GetIt.instance.get<ArtemisClient>();
  try {
    final response = await client.execute(MyHubsQuery());
    if (response.errors?.isNotEmpty == true) {
      next(DidFailReloadHubsAction(reason: response.errors.toString()));
    }

    final hubs = response.data?.users?.me?.hubs;
    if (hubs != null) {
      next(
        DidReloadHubsAction(
            hubs: hubs
                .map((raw) => Hub(
                    id: raw.id,
                    name: raw.name,
                    url: raw.url,
                    items: raw.items.map((raw) => raw.id)))
                .toList(),
            items: hubs
                .map((hub) => hub.items)
                .expand((item) => item)
                .map((raw) => Item(
                      id: raw.id,
                      url: raw.url,
                      origin: raw.origin,
                    ))
                .fold({}, (map, item) => map..[item.id] = item)),
      );
    } else {
      next(
        DidReloadHubsAction(hubs: List.empty(), items: Map.identity()),
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

void _createHub(
  Store<AppState> store,
  CreateHubAction action,
  NextDispatcher next,
) async {
  next(action);
  next(const CreatingHubAction());
  final client = GetIt.instance.get<ArtemisClient>();

  try {
    final response = await client.execute(CreateHubQuery(
      variables: CreateHubArguments(
        name: action.name,
      ),
    ));
    if (response.errors?.isNotEmpty == true) {
      next(
        DidFailCreateHubAction(
          reason: response.errors
              ?.fold('', (String string, error) => string + error.message),
        ),
      );
    }

    final hub = response.data?.users?.me?.createHub;
    if (hub != null) {
      next(
        DidCreateHubAction(
          hub: Hub(
            id: hub.id,
            name: hub.name,
            url: hub.url,
            items: hub.items.map((raw) => raw.id),
          ),
          items: hub.items
              .map((raw) => Item(
                    id: raw.id,
                    url: raw.url,
                    origin: raw.origin,
                  ))
              .fold({}, (map, item) => map..[item.id] = item),
        ),
      );
    }
  } on gql.ServerException catch (e) {
    switch (e.originalException.runtimeType) {
      case SocketException:
        next(const DidFailCreateHubAction(reason: 'No internet connection.'));
        return;
      default:
        next(const DidFailCreateHubAction(reason: 'Smth went wrong.'));
    }
  } catch (_) {
    next(const DidFailCreateHubAction(reason: 'Smth went wrong.'));
  }
}
