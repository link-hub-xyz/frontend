import 'package:flutter/foundation.dart';
import 'package:linkhub/core/model/analytics_sample_data.dart';

import '../actions.dart';

@immutable
class ReloadAnalyticsAction {
  const ReloadAnalyticsAction();
}

@immutable
class ReloadingAnalyticsAction {
  const ReloadingAnalyticsAction();
}

@immutable
class DidReloadAnalyticsAction {
  final List<AnalyticsSampleData> daily;
  final List<AnalyticsSampleData> retention;
  final List<AnalyticsSampleData> total;

  const DidReloadAnalyticsAction({
    required this.daily,
    required this.retention,
    required this.total,
  });
}

@immutable
class DidFailReloadAnalyticsAction extends FailureAction {
  const DidFailReloadAnalyticsAction({required reason}) : super(reason);
}
