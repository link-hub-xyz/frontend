import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'auth/state.dart';

@immutable
class AppState extends Equatable {
  final AuthState auth;

  const AppState({required this.auth});

  factory AppState.initial() => AppState(
        auth: AuthState.initial(),
      );

  @override
  List<Object?> get props => [
        auth,
      ];
}
