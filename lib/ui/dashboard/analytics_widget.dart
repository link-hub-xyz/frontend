import 'package:flutter/material.dart';

class DashboardAnalyticsWidget extends StatelessWidget {
  const DashboardAnalyticsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
          child: Column(
        children: [
          const Text('total analytics will be here...'),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Expanded(child: Center(child: Text('Per day'))),
                VerticalDivider(),
                Expanded(child: Center(child: Text('total'))),
                VerticalDivider(),
                Expanded(child: Center(child: Text('promo image'))),
              ],
            ),
          ),
        ],
      ));
}
