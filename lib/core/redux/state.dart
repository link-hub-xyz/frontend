import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'analytics/state.dart';
import 'auth/state.dart';
import 'hubs/state.dart';
import 'items/state.dart';

@immutable
class AppState extends Equatable {
  final AuthState auth;
  final HubsState hubs;
  final ItemsState items;
  final AnalyticsState analytics;

  const AppState({
    required this.auth,
    required this.hubs,
    required this.items,
    required this.analytics,
  });

  factory AppState.initial() => AppState(
        auth: AuthState.initial(),
        hubs: HubsState.initial(),
        items: ItemsState.initial(),
        analytics: AnalyticsState.initial(),
      );

  @override
  List<Object?> get props => [
        auth,
        hubs,
        items,
        analytics,
      ];
}
