import 'dart:io';

import 'package:artemis/artemis.dart';
import 'package:get_it/get_it.dart';
import 'package:linkhub/core/model/analytics_sample_data.dart';
import 'package:redux/redux.dart';
import 'package:gql_link/gql_link.dart' as gql;
import 'package:linkhub/core/api/api.graphql.dart';

import '../state.dart';
import 'actions.dart';

final List<Middleware<AppState>> analyticsMiddlewares = [
  TypedMiddleware<AppState, ReloadAnalyticsAction>(_reloadAnalytics)
];

void _reloadAnalytics(
  Store<AppState> store,
  ReloadAnalyticsAction action,
  NextDispatcher next,
) async {
  next(action);
  next(const ReloadingAnalyticsAction());
  final client = GetIt.instance.get<ArtemisClient>();
  try {
    final response = await client.execute(UserAnalyticsQuery());
    if (response.errors?.isNotEmpty == true) {
      next(DidFailReloadAnalyticsAction(reason: response.errors.toString()));
    }

    final analytics = response.data?.users?.me?.analytics;
    if (analytics != null) {
      next(DidReloadAnalyticsAction(
        daily: analytics.daily
            .map((raw) => AnalyticsSampleData(value: raw.value, date: raw.date))
            .toList(),
        retention: analytics.retention
            .map((raw) => AnalyticsSampleData(value: raw.value, date: raw.date))
            .toList(),
        total: analytics.total
            .map((raw) => AnalyticsSampleData(value: raw.value, date: raw.date))
            .toList(),
      ));
    } else {
      next(
        DidReloadAnalyticsAction(
          daily: List.empty(),
          retention: List.empty(),
          total: List.empty(),
        ),
      );
    }
  } on gql.ServerException catch (e) {
    switch (e.originalException.runtimeType) {
      case SocketException:
        next(const DidFailReloadAnalyticsAction(
            reason: 'No internet connection.'));
        return;
      default:
        next(const DidFailReloadAnalyticsAction(reason: 'Smth went wrong.'));
    }
  } catch (_) {
    next(const DidFailReloadAnalyticsAction(reason: 'Smth went wrong.'));
  }
}
