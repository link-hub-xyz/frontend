import 'package:linkhub/core/model/data_status.dart';
import 'package:linkhub/core/redux/auth/actions.dart';
import 'package:redux/redux.dart';

import 'actions.dart';
import 'state.dart';

final hubsReducer = combineReducers<HubsState>([
  TypedReducer<HubsState, ReloadingHubsAction>(_reloadingReducer),
  TypedReducer<HubsState, DidReloadHubsAction>(_didReloadReducer),
  TypedReducer<HubsState, DidFailReloadHubsAction>(_didFailedReloadReducer),
  TypedReducer<HubsState, DidSignOutAction>(_signOutReducer),
]);

HubsState _reloadingReducer(
  HubsState state,
  ReloadingHubsAction action,
) =>
    HubsState(
      status: DataStatus.inProgress,
      list: state.list,
    );

HubsState _didReloadReducer(
  HubsState state,
  DidReloadHubsAction action,
) =>
    HubsState(
      status: DataStatus.success,
      list: action.hubs,
    );

HubsState _didFailedReloadReducer(
  HubsState state,
  DidFailReloadHubsAction action,
) =>
    HubsState(
      status: DataStatus.error,
      list: state.list,
    );

HubsState _signOutReducer(HubsState state, DidSignOutAction action) =>
    HubsState.initial();
