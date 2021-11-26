import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String id;
  final String url;

  const Item({
    required this.id,
    required this.url,
  });

  @override
  List<Object?> get props => [
        id,
        url,
      ];
}
