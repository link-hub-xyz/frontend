import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String id;
  final String url;
  final String origin;

  const Item({
    required this.id,
    required this.url,
    required this.origin,
  });

  @override
  List<Object?> get props => [
        id,
        url,
        origin,
      ];
}
