import 'package:equatable/equatable.dart';
import 'package:linkhub/core/model/data_status.dart';
import 'package:linkhub/core/model/hub.dart';

class HubsState extends Equatable {
  final DataStatus status;
  final List<String> order;
  final Map<String, Hub> map;

  const HubsState({
    required this.status,
    required this.order,
    required this.map,
  });

  factory HubsState.initial() => const HubsState(
        status: DataStatus.initial,
        order: [],
        map: {},
      );

  @override
  List<Object?> get props => [
        status,
        order,
        map,
      ];
}
