import 'package:equatable/equatable.dart';

class Hub extends Equatable {
  final String id;
  final String name;
  const Hub({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
