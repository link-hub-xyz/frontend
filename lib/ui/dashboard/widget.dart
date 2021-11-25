import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:linkhub/ui/side/widget.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Theme(
              data: ThemeData.dark().copyWith(
                colorScheme: Theme.of(context).colorScheme,
              ),
              child: const SideWidget()),
          const Expanded(child: AutoRouter()),
        ],
      );
}
