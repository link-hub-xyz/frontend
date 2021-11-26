import 'package:flutter/material.dart';
import 'package:linkhub/core/model/hub.dart';

class HubWidget extends StatefulWidget {
  final Hub hub;
  final VoidCallback more;

  const HubWidget({
    Key? key,
    required this.hub,
    required this.more,
  }) : super(key: key);

  @override
  State<HubWidget> createState() => _HubWidgetState();
}

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
                subtitle: Text('12 items'),
                trailing: Visibility(
                  visible: isHovered,
                  child: IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.more_vert),
                  ),
                ),
              ),
              ListTile(
                title: const Text('ID'),
                subtitle: Text(widget.hub.id),
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
                            Icon(
                              Icons.arrow_right_alt,
                            ),
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