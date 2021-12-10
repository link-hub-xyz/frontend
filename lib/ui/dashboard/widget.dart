import 'package:flutter/material.dart';
import 'package:linkhub/core/model/analytics_sample_data.dart';
import 'package:linkhub/core/model/data_status.dart';
import 'package:linkhub/core/model/hub.dart';

import 'analytics_widget.dart';
import 'hub_widget.dart';

class DashboardProps {
  VoidCallback? reloadHubs;
  VoidCallback? reloadAnalytics;
  List<Hub> hubs;
  final List<AnalyticsSampleData> daily;
  final List<AnalyticsSampleData> retention;
  final List<AnalyticsSampleData> total;
  void Function(String) more;
  void Function(String) share;
  void Function(String) delete;
  VoidCallback create;

  DashboardProps({
    required this.reloadHubs,
    required this.reloadAnalytics,
    required this.hubs,
    required this.daily,
    required this.retention,
    required this.total,
    required this.more,
    required this.share,
    required this.delete,
    required this.create,
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
      if (!isScrolledToTop) {
        setState(() => isScrolledToTop = true);
      }
    } else {
      if (_controller.offset > emptySpace && isScrolledToTop) {
        setState(() => isScrolledToTop = false);
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
        body: SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                  left: 52,
                  right: 34,
                  bottom: 8,
                ),
                child: AspectRatio(
                  aspectRatio: 2.5,
                  child: DashboardAnalyticsWidget(
                    loading: widget.props.reloadAnalytics == null,
                    daily: widget.props.daily,
                    retention: widget.props.retention,
                    total: widget.props.total,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                  left: 56,
                  right: 34,
                  bottom: 8,
                ),
                child: Row(
                  children: [
                    Text(
                      'Hubs',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.left,
                    ),
                    const Spacer(),
                    TextButton.icon(
                      onPressed: widget.props.create,
                      icon: const Icon(Icons.add),
                      label: const Text('Create hub'),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: widget.props.reloadHubs != null &&
                    widget.props.hubs.isNotEmpty,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(
                      top: 16, left: 52, right: 34, bottom: 96),
                  primary: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 320,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 3 / 2,
                  ),
                  itemCount: widget.props.hubs.length,
                  itemBuilder: (context, index) => HubWidget(
                    hub: widget.props.hubs[index],
                    more: () => widget.props.more(widget.props.hubs[index].id),
                    share: () =>
                        widget.props.share(widget.props.hubs[index].id),
                    delete: () =>
                        widget.props.delete(widget.props.hubs[index].id),
                  ),
                ),
                replacement: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            ],
          ),
        ),
      );
}
