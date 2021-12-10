import 'package:flutter/material.dart';
import 'package:linkhub/core/model/analytics_sample_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalyticsItemWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final Iterable<AnalyticsSampleData> data;

  const AnalyticsItemWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.data,
  }) : super(key: key);

  @override
  State<AnalyticsItemWidget> createState() => _AnalyticsItemWidgetState();
}

class _AnalyticsItemWidgetState extends State<AnalyticsItemWidget> {
  late TrackballBehavior _trackballBehavior;
  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
      enable: true,
      tooltipDisplayMode: TrackballDisplayMode.nearestPoint,
      activationMode: ActivationMode.singleTap,
      tooltipSettings: const InteractiveTooltip(
        format: 'point.y',
        borderWidth: 0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.subtitle, style: Theme.of(context).textTheme.caption),
            Text(widget.title, style: Theme.of(context).textTheme.headline5),
            Expanded(
              child: Visibility(
                replacement: const Center(child: Text('No data')),
                visible: widget.data.isNotEmpty,
                child: Center(
                  child: SfCartesianChart(
                    // legend: Legend(
                    //   isVisible: true,
                    //   position: LegendPosition.bottom,
                    //   alignment: ChartAlignment.far,
                    // ),
                    primaryXAxis: DateTimeAxis(
                      majorGridLines: const MajorGridLines(width: 0),
                    ),
                    primaryYAxis: NumericAxis(
                      axisLine: const AxisLine(width: 0),
                      majorTickLines: const MajorTickLines(size: 0),
                      maximumLabels: 3,
                    ),
                    palette: [
                      Colors.grey,
                      Theme.of(context).colorScheme.primary,
                    ],
                    trackballBehavior: _trackballBehavior,
                    series: widget.data.isNotEmpty
                        ? <LineSeries<AnalyticsSampleData, DateTime>>[
                            LineSeries<AnalyticsSampleData, DateTime>(
                              dataSource: (() {
                                var max = (widget.data.toList()
                                      ..sort(
                                          (a, b) => a.value.compareTo(b.value)))
                                    .last
                                    .value;
                                return widget.data
                                    .toList()
                                    .map((item) => AnalyticsSampleData(
                                          value: max,
                                          date: item.date,
                                        ))
                                    .toList();
                              })(),
                              xValueMapper: (sales, _) => sales.date,
                              yValueMapper: (sales, _) => sales.value,
                              name: 'Max',
                            ),
                            LineSeries<AnalyticsSampleData, DateTime>(
                              name: 'This week',
                              dataSource: widget.data.toList(),
                              markerSettings: const MarkerSettings(
                                height: 6,
                                width: 6,
                                isVisible: true,
                                shape: DataMarkerType.circle,
                              ),
                              xValueMapper: (sales, _) => sales.date,
                              yValueMapper: (sales, _) => sales.value,
                            ),
                          ]
                        : null,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
