import 'package:flutter/material.dart';

class AnalyticsWidget extends StatelessWidget {
  const AnalyticsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Analytics'),
        ),
        body: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      );
}
