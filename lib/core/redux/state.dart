import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'auth/state.dart';
import 'hubs/state.dart';
import 'items/state.dart';

@immutable
class AppState extends Equatable {
  final AuthState auth;
  final HubsState hubs;
  final ItemsState items;

  const AppState({
    required this.auth,
    required this.hubs,
    required this.items,
  });

  factory AppState.initial() => AppState(
        auth: AuthState.initial(),
        hubs: HubsState.initial(),
        items: ItemsState.initial(),
      );

  @override
  List<Object?> get props => [
        auth,
        hubs,
        items,
      ];
}
