import 'package:flutter/material.dart';
import 'package:linkhub/core/model/hub.dart';

class HubWidget extends StatefulWidget {
  final Hub hub;
  final VoidCallback more;
  final VoidCallback share;
  final VoidCallback delete;

  const HubWidget({
    Key? key,
    required this.hub,
    required this.more,
    required this.share,
    required this.delete,
  }) : super(key: key);

  @override
  State<HubWidget> createState() => _HubWidgetState();
}

enum _HubWidgetAction { share, delete }

class _HubWidgetState extends State<HubWidget> {
  bool isHovered = false;

  void _incrementEnter(PointerEvent details) {
    setState(() => isHovered = true);
  }

  void _incrementExit(PointerEvent details) {
    setState(() => isHovered = false);
  }

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: _incrementEnter,
        onExit: _incrementExit,
        child: Card(
          elevation: isHovered ? 12.0 : null,
          child: Column(
            children: [
              const SizedBox(height: 4.0),
              ListTile(
                dense: true,
                leading: const Icon(Icons.device_hub),
                title: Text(widget.hub.name),
                subtitle: Text(
                  () {
                    switch (widget.hub.items.length) {
                      case 0:
                        return 'Empty hub';
                      case 1:
                        return '1 item';
                      default:
                        return '${widget.hub.items.length} items';
                    }
                  }(),
                ),
                trailing: Visibility(
                  maintainState: true,
                  visible: isHovered,
                  child: PopupMenuButton(
                    tooltip: 'Options',
                    icon: const Icon(Icons.more_vert),
                    onSelected: (action) {
                      switch (action) {
                        case _HubWidgetAction.share:
                          return widget.share();
                        case _HubWidgetAction.delete:
                          return widget.delete();
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Row(
                          children: const [
                            Text("Share"),
                            Spacer(),
                            Icon(Icons.share, size: 16),
                          ],
                        ),
                        value: _HubWidgetAction.share,
                      ),
                      PopupMenuItem(
                        child: Row(
                          children: const [
                            Text("Delete"),
                            Spacer(),
                            Icon(Icons.delete, size: 16),
                          ],
                        ),
                        value: _HubWidgetAction.delete,
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: const Text('ID'),
                subtitle: Text(widget.hub.id),
              ),
              const ListTile(
                title: Text('Analytics graph?...'),
              ),
              const Spacer(),
              Visibility(
                visible: isHovered,
                child: ListTile(
                  title: Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: widget.more,
                        child: Row(
                          children: const [
                            Text('More'),
                            SizedBox(width: 4.0),
                            Icon(Icons.arrow_right_alt),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
