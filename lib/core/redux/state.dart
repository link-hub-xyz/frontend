import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'auth/state.dart';
import 'hubs/state.dart';

@immutable
class AppState extends Equatable {
  final AuthState auth;
  final HubsState hubs;

  const AppState({
    required this.auth,
    required this.hubs,
  });

  factory AppState.initial() => AppState(
        auth: AuthState.initial(),
        hubs: HubsState.initial(),
      );

  @override
  List<Object?> get props => [
        auth,
        hubs,
      ];
}
