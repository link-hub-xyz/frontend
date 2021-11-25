import 'package:equatable/equatable.dart';

class Hub extends Equatable {
  final String id;

  const Hub({required this.id});

  @override
  List<Object?> get props => [
        id,
      ];
}
