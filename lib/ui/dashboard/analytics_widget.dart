import 'dart:math';

import 'package:flutter/material.dart';
import 'package:linkhub/core/model/analytics_sample_data.dart';

import 'analytics_item.dart';

class DashboardAnalyticsWidget extends StatelessWidget {
  final bool loading;
  final List<AnalyticsSampleData> daily;
  final List<AnalyticsSampleData> retention;
  final List<AnalyticsSampleData> total;

  const DashboardAnalyticsWidget({
    Key? key,
    required this.loading,
    required this.daily,
    required this.retention,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        child: Visibility(
          replacement: const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          visible: loading == false,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: () => {},
                    icon: const Icon(
                      Icons.analytics,
                      color: Colors.grey,
                    ),
                    label: Text(
                      'Analytics',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 4.0),
                    Expanded(
                      child: Center(
                        child: AnalyticsItemWidget(
                          title: daily
                              .map((item) => item.value)
                              .fold(0, (int res, curr) => max(res, curr))
                              .toString(),
                          subtitle: 'Daily interactions',
                          data: daily,
                        ),
                      ),
                    ),
                    const VerticalDivider(),
                    Expanded(
                      child: Center(
                        child: AnalyticsItemWidget(
                          title: '--%',
                          subtitle: 'Retention',
                          data: retention,
                        ),
                      ),
                    ),
                    const VerticalDivider(),
                    Expanded(
                      child: Center(
                        child: AnalyticsItemWidget(
                          title: total
                              .map((item) => item.value)
                              .fold(0, (int res, curr) => max(res, curr))
                              .toString(),
                          subtitle: 'Total interactions',
                          data: total,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
