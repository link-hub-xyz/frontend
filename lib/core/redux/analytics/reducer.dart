import 'package:linkhub/core/model/data_status.dart';
import 'package:redux/redux.dart';

import 'actions.dart';
import 'state.dart';

part 'reducer.dashboard.dart';

final analyticsReducer = combineReducers<AnalyticsState>([
  _dashboardReducer,
]);

AnalyticsState _dashboardReducer(AnalyticsState state, action) =>
    state.copyWith(
      dashboard: __dashboardReducer(state.dashboard, action),
    );
