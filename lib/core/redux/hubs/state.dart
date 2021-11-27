import 'package:equatable/equatable.dart';
import 'package:linkhub/core/model/data_status.dart';
import 'package:linkhub/core/model/hub.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'state.g.dart';

@CopyWith()
class HubsState extends Equatable {
  final DataStatus status;
  final DataStatus creationStatus;
  final List<String> order;
  final Map<String, Hub> map;

  const HubsState({
    required this.status,
    required this.creationStatus,
    required this.order,
    required this.map,
  });

  factory HubsState.initial() => const HubsState(
        status: DataStatus.initial,
        creationStatus: DataStatus.initial,
        order: [],
        map: {},
      );

  @override
  List<Object?> get props => [
        status,
        creationStatus,
        order,
        map,
      ];
}
