import 'package:flutter/material.dart';
import 'package:linkhub/core/model/hub.dart';

import 'analytics_widget.dart';
import 'hub_widget.dart';

class DashboardProps {
  VoidCallback? reload;
  List<Hub> hubs;
  void Function(String) more;
  VoidCallback createHub;

  DashboardProps({
    required this.reload,
    required this.hubs,
    required this.more,
    required this.createHub,
  });
}

class DashboardWidget extends StatefulWidget {
  final DashboardProps props;
  const DashboardWidget({Key? key, required this.props}) : super(key: key);

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  static const double emptySpace = 10.0;
  late ScrollController _controller;
  bool isScrolledToTop = true;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      //call setState only when values are about to change
      if (!isScrolledToTop) {
        setState(() {
          //reach the top
          isScrolledToTop = true;
        });
      }
    } else {
      //call setState only when values are about to change
      if (_controller.offset > emptySpace && isScrolledToTop) {
        setState(() {
          //not the top
          isScrolledToTop = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: isScrolledToTop ? 0 : null,
          backgroundColor: isScrolledToTop
              ? Theme.of(context).scaffoldBackgroundColor
              : null,
          title: const Text('Dashboard'),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 32, left: 52, right: 34, bottom: 8),
                    child: AspectRatio(
                      aspectRatio: 2.5,
                      child: DashboardAnalyticsWidget(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 32, left: 56, right: 34, bottom: 8),
                    child: Row(
                      // width: MediaQuery.of(context).size.width,
                      children: [
                        Text(
                          'Hubs',
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.left,
                        ),
                        const Spacer(),
                        TextButton.icon(
                          onPressed: widget.props.createHub,
                          icon: const Icon(Icons.add),
                          label: const Text('Create hub'),
                        ),
                      ],
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(
                        top: 16, left: 52, right: 34, bottom: 96),
                    primary: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 320,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 3 / 2,
                    ),
                    itemCount: widget.props.hubs.length,
                    itemBuilder: (context, index) => HubWidget(
                      hub: widget.props.hubs[index],
                      more: () =>
                          widget.props.more(widget.props.hubs[index].id),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: widget.props.reload == null && widget.props.hubs.isEmpty,
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          ],
        ),
      );
}
