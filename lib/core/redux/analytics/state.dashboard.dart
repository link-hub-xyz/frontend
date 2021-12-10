part of 'state.dart';

@CopyWith()
class DashboardAnalyticsState extends Equatable {
  final DataStatus status;
  final List<AnalyticsSampleData> daily;
  final List<AnalyticsSampleData> retention;
  final List<AnalyticsSampleData> total;

  const DashboardAnalyticsState({
    required this.status,
    required this.daily,
    required this.retention,
    required this.total,
  });

  factory DashboardAnalyticsState.initial() => const DashboardAnalyticsState(
        status: DataStatus.initial,
        daily: [],
        retention: [],
        total: [],
      );

  @override
  List<Object?> get props => [
        status,
        daily,
        retention,
        total,
      ];
}
