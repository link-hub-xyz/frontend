import 'package:linkhub/core/redux/hubs/actions.dart';
import 'package:redux/redux.dart';

import 'state.dart';

final itemsReducer = combineReducers<ItemsState>([
  TypedReducer<ItemsState, DidReloadHubsAction>(_didReloadHubsReducer),
]);

ItemsState _didReloadHubsReducer(
  ItemsState state,
  DidReloadHubsAction action,
) =>
    ItemsState(
      map: Map.from(state.map)..addAll(action.items),
    );
