import 'package:equatable/equatable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'state.g.dart';

@CopyWith()
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
