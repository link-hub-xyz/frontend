import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool isAuthorised;
  final String? id;

  const AuthState({
    required this.isAuthorised,
    this.id,
  });

  factory AuthState.initial() => const AuthState(isAuthorised: false);

  @override
  List<Object?> get props => [
        isAuthorised,
        id,
      ];
}
