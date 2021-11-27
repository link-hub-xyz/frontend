import 'package:linkhub/core/model/data_status.dart';
import 'package:linkhub/core/redux/auth/actions.dart';
import 'package:redux/redux.dart';

import 'actions.dart';
import 'state.dart';

final hubsReducer = combineReducers<HubsState>([
  TypedReducer<HubsState, ReloadingHubsAction>(_reloadingReducer),
  TypedReducer<HubsState, DidReloadHubsAction>(_didReloadReducer),
  TypedReducer<HubsState, DidFailReloadHubsAction>(_didFailedReloadReducer),
  TypedReducer<HubsState, CreatingHubAction>(_creatingReducer),
  TypedReducer<HubsState, DidCreateHubAction>(_didCreateReducer),
  TypedReducer<HubsState, DidFailCreateHubAction>(_didFailedCreatingReducer),
  TypedReducer<HubsState, DownloadHubAction>(_downloadingReducer),
  TypedReducer<HubsState, DidDownloadHubAction>(_didDownloadReducer),
  TypedReducer<HubsState, DidFailDownloadingHubAction>(
      _didFailedDownloadingReducer),
  TypedReducer<HubsState, DidSignOutAction>(_signOutReducer),
]);

HubsState _reloadingReducer(
  HubsState state,
  ReloadingHubsAction action,
) =>
    state.copyWith(status: DataStatus.inProgress);

HubsState _didReloadReducer(
  HubsState state,
  DidReloadHubsAction action,
) =>
    state.copyWith(
      status: DataStatus.success,
      order: action.hubs.map((hub) => hub.id).toList(),
      map: Map.from(state.map)
        ..addAll(action.hubs.fold({}, (map, hub) => map..[hub.id] = hub)),
    );

HubsState _didFailedReloadReducer(
  HubsState state,
  DidFailReloadHubsAction action,
) =>
    state.copyWith(status: DataStatus.error);

HubsState _creatingReducer(
  HubsState state,
  CreatingHubAction action,
) =>
    state.copyWith(creationStatus: DataStatus.inProgress);

HubsState _didCreateReducer(
  HubsState state,
  DidCreateHubAction action,
) =>
    state.copyWith(
        creationStatus: DataStatus.success,
        order: [action.hub.id] + state.order,
        map: Map.from(state.map)
          ..addAll(
            {action.hub.id: action.hub},
          ));

HubsState _didFailedCreatingReducer(
  HubsState state,
  DidFailCreateHubAction action,
) =>
    state.copyWith(creationStatus: DataStatus.error);

HubsState _downloadingReducer(
  HubsState state,
  DownloadHubAction action,
) =>
    state.copyWith(downloadStatus: DataStatus.inProgress);

HubsState _didDownloadReducer(
  HubsState state,
  DidDownloadHubAction action,
) =>
    state.copyWith(
        downloadStatus: DataStatus.success,
        order: [action.hub.id] + state.order,
        map: Map.from(state.map)
          ..addAll(
            {action.hub.id: action.hub},
          ));

HubsState _didFailedDownloadingReducer(
  HubsState state,
  DidFailDownloadingHubAction action,
) =>
    state.copyWith(downloadStatus: DataStatus.error);

HubsState _signOutReducer(HubsState state, DidSignOutAction action) =>
    HubsState.initial();
