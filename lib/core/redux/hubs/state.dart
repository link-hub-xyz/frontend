import 'package:equatable/equatable.dart';
import 'package:linkhub/core/model/data_status.dart';
import 'package:linkhub/core/model/hub.dart';

class HubsState extends Equatable {
  final DataStatus status;
  final List<Hub> list;

  const HubsState({
    required this.status,
    required this.list,
  });

  factory HubsState.initial() => const HubsState(
        status: DataStatus.initial,
        list: [],
      );

  @override
  List<Object?> get props => [
        status,
        list,
      ];
}
