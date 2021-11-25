import 'package:equatable/equatable.dart';
import 'package:linkhub/core/model/data_status.dart';
import 'package:linkhub/core/model/hub.dart';

class HubsState extends Equatable {
  final DataStatus status;
  final List<Hub> hubs;

  const HubsState({
    required this.status,
    required this.hubs,
  });

  factory HubsState.initial() => const HubsState(
        status: DataStatus.initial,
        hubs: [],
      );

  @override
  List<Object?> get props => [
        hubs,
      ];
}
