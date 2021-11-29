import 'dart:io';
import 'package:gql_link/gql_link.dart' as gql;
import 'package:linkhub/core/model/item.dart';
import 'package:redux/redux.dart';
import 'package:artemis/artemis.dart';
import 'package:get_it/get_it.dart';
import 'package:linkhub/core/api/api.graphql.dart';
import './actions.dart';
import '../state.dart';

final List<Middleware<AppState>> itemsMiddlewares = [
  TypedMiddleware<AppState, CreateItemAction>(_createItem),
];

void _createItem(
  Store<AppState> store,
  CreateItemAction action,
  NextDispatcher next,
) async {
  next(action);
  next(const CreatingItemAction());
  final client = GetIt.instance.get<ArtemisClient>();

  try {
    final response = await client.execute(CreateItemQuery(
      variables: CreateItemArguments(
        id: action.hubId,
        url: action.url,
      ),
    ));
    if (response.errors?.isNotEmpty == true) {
      next(
        DidFailCreateItemAction(
          reason: response.errors
              ?.fold('', (String string, error) => string + error.message),
        ),
      );
    }

    final item = response.data?.hub?.createItem;
    if (item != null) {
      next(
        DidCreateItemAction(
          id: action.hubId,
          item: Item(
            id: item.id,
            url: item.url,
            origin: item.origin,
          ),
        ),
      );
    }
  } on gql.ServerException catch (e) {
    switch (e.originalException.runtimeType) {
      case SocketException:
        next(const DidFailCreateItemAction(reason: 'No internet connection.'));
        return;
      default:
        next(const DidFailCreateItemAction(reason: 'Smth went wrong.'));
    }
  } catch (_) {
    next(const DidFailCreateItemAction(reason: 'Smth went wrong.'));
  }
}
