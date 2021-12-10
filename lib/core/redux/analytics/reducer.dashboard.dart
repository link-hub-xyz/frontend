part of 'reducer.dart';

final __dashboardReducer = combineReducers<DashboardAnalyticsState>([
  TypedReducer<DashboardAnalyticsState, ReloadingAnalyticsAction>(
    _reloadingReducer,
  ),
  TypedReducer<DashboardAnalyticsState, DidReloadAnalyticsAction>(
    _didReloadReducer,
  ),
  TypedReducer<DashboardAnalyticsState, DidFailReloadAnalyticsAction>(
    _didFailedReloadReducer,
  ),
]);

DashboardAnalyticsState _reloadingReducer(
  DashboardAnalyticsState state,
  ReloadingAnalyticsAction action,
) =>
    state.copyWith(status: DataStatus.inProgress);

DashboardAnalyticsState _didReloadReducer(
  DashboardAnalyticsState state,
  DidReloadAnalyticsAction action,
) =>
    state.copyWith(
      status: DataStatus.success,
      daily: action.daily,
      retention: action.retention,
      total: action.total,
    );

DashboardAnalyticsState _didFailedReloadReducer(
  DashboardAnalyticsState state,
  DidFailReloadAnalyticsAction action,
) =>
    state.copyWith(status: DataStatus.error);
