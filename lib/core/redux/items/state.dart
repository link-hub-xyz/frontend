import 'package:equatable/equatable.dart';
import 'package:linkhub/core/model/data_status.dart';
import 'package:linkhub/core/model/item.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'state.g.dart';

@CopyWith()
class ItemsState extends Equatable {
  final Map<String, Item> map;
  final DataStatus creating;

  const ItemsState({
    required this.map,
    required this.creating,
  });

  factory ItemsState.initial() => const ItemsState(
        map: {},
        creating: DataStatus.initial,
      );

  @override
  List<Object?> get props => [
        map,
        creating,
      ];
}
