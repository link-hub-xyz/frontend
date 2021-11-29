import 'package:linkhub/core/model/data_status.dart';
import 'package:linkhub/core/redux/hubs/actions.dart';
import 'package:linkhub/core/redux/items/actions.dart';
import 'package:redux/redux.dart';

import 'state.dart';

final itemsReducer = combineReducers<ItemsState>([
  TypedReducer<ItemsState, DidReloadHubsAction>(_didReloadHubsReducer),
  TypedReducer<ItemsState, DidCreateHubAction>(_didCreateReducer),
  TypedReducer<ItemsState, DidDownloadHubAction>(_didDownloadReducer),
  TypedReducer<ItemsState, CreateItemAction>(_createReducer),
  TypedReducer<ItemsState, CreatingItemAction>(_creatingReducer),
  TypedReducer<ItemsState, DidCreateItemAction>(_didCreateItemReducer),
  TypedReducer<ItemsState, DidFailCreateItemAction>(_didFailCreateItemReducer),
]);

ItemsState _didReloadHubsReducer(
  ItemsState state,
  DidReloadHubsAction action,
) =>
    state.copyWith(
      map: Map.from(state.map)..addAll(action.items),
    );

ItemsState _didCreateReducer(
  ItemsState state,
  DidCreateHubAction action,
) =>
    state.copyWith(
      map: Map.from(state.map)..addAll(action.items),
    );

ItemsState _didDownloadReducer(
  ItemsState state,
  DidDownloadHubAction action,
) =>
    state.copyWith(
      map: Map.from(state.map)..addAll(action.items),
    );

//////

ItemsState _createReducer(
  ItemsState state,
  CreateItemAction action,
) =>
    state.copyWith(creating: DataStatus.initial);

ItemsState _creatingReducer(
  ItemsState state,
  CreatingItemAction action,
) =>
    state.copyWith(creating: DataStatus.inProgress);

ItemsState _didCreateItemReducer(
  ItemsState state,
  DidCreateItemAction action,
) =>
    state.copyWith(
      creating: DataStatus.success,
      map: Map.from(state.map)
        ..addAll({
          action.id: action.item,
        }),
    );

ItemsState _didFailCreateItemReducer(
  ItemsState state,
  DidFailCreateItemAction action,
) =>
    state.copyWith(creating: DataStatus.error);
