import 'package:equatable/equatable.dart';

class Hub extends Equatable {
  final String id;
  final String name;
  final String url;
  final Iterable<String> items;

  const Hub({
    required this.id,
    required this.name,
    required this.url,
    required this.items,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        url,
        items,
      ];
}
