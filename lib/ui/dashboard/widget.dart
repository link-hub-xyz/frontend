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
            SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 32, left: 52, right: 34, bottom: 8),
                    child: AspectRatio(
                      aspectRatio: 2.5,
                      child: Card(
                        child: Text('total analytics will be here...'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 32, left: 56, right: 34, bottom: 8),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Hubs',
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(
                        top: 16, left: 52, right: 34, bottom: 8),
                    primary: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
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
                ],
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
