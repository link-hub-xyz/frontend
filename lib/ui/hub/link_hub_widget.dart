import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'connector.dart';

class LinkHubWidget extends StatelessWidget {
  final String id;
  const LinkHubWidget({
    Key? key,
    @PathParam('hub') required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => HubConnector(id: id);
}
