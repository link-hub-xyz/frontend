import 'package:flutter/material.dart';
import 'package:linkhub/core/model/hub.dart';

import 'hub_widget.dart';

class DashboardProps {
  VoidCallback? reload;
  List<Hub> hubs;
  void Function(String) more;

  DashboardProps({
    required this.reload,
    required this.hubs,
    required this.more,
  });
}

class DashboardWidget extends StatelessWidget {
  final DashboardProps props;
  const DashboardWidget({Key? key, required this.props}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Dashboard'),
        ),
        body: Stack(
          children: [
            GridView.builder(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              padding: const EdgeInsets.all(16.0),
              primary: false,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: props.hubs.length,
              itemBuilder: (context, index) => HubWidget(
                hub: props.hubs[index],
                more: () => props.more(props.hubs[index].id),
              ),
            ),
            Visibility(
              visible: props.reload == null && props.hubs.isEmpty,
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          ],
        ),
      );
}
