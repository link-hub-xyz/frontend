import 'package:flutter/material.dart';

class HubProps {
  final String? name;

  HubProps({required this.name});
}

class HubWidget extends StatelessWidget {
  final HubProps props;
  const HubWidget({Key? key, required this.props}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: props.name?.isNotEmpty == true ? Text(props.name!) : null,
        ),
        body: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      );
}
