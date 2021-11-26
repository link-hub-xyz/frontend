import 'package:flutter/material.dart';
import 'package:linkhub/core/model/data_status.dart';
import 'package:linkhub/core/model/hub.dart';

import 'items_connector.dart';
import 'items_widget.dart';

class HubProps {
  final Hub? hub;
  final DataStatus status;

  HubProps({
    required this.hub,
    required this.status,
  });
}

class HubWidget extends StatelessWidget {
  final HubProps props;
  const HubWidget({Key? key, required this.props}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title:
              props.hub?.name.isNotEmpty == true ? Text(props.hub!.name) : null,
        ),
        body: Stack(children: [
          if (props.hub != null)
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(96.0),
                child: Column(
                  children: [
                    ItemsConnector(id: props.hub!.id),
                    // Spacer(),
                  ],
                ),
              ),
            ),
          Visibility(
            visible: props.hub == null && props.status == DataStatus.inProgress,
            child: const Center(
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
              ),
            ),
          ),
        ]),
      );
}
