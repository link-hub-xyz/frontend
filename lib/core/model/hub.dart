import 'package:equatable/equatable.dart';

class Hub extends Equatable {
  final String id;
  final String name;
  final Iterable<String> items;

  const Hub({
    required this.id,
    required this.name,
    required this.items,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        items,
      ];
}
