import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:linkhub/core/model/analytics_sample_data.dart';
import 'package:linkhub/core/model/data_status.dart';

part 'state.g.dart';
part 'state.dashboard.dart';

@CopyWith()
class AnalyticsState extends Equatable {
  final DashboardAnalyticsState dashboard;

  const AnalyticsState({
    required this.dashboard,
  });

  factory AnalyticsState.initial() => AnalyticsState(
        dashboard: DashboardAnalyticsState.initial(),
      );

  @override
  List<Object?> get props => [
        dashboard,
      ];
}
