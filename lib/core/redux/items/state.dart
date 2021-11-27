import 'package:equatable/equatable.dart';
// import 'package:linkhub/core/model/data_status.dart';
import 'package:linkhub/core/model/item.dart';

class ItemsState extends Equatable {
  final Map<String, Item> map;

  const ItemsState({
    required this.map,
  });

  factory ItemsState.initial() => const ItemsState(
        map: {},
      );

  @override
  List<Object?> get props => [
        map,
      ];
}
