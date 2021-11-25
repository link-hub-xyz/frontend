import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainProps {
  VoidCallback signOut;
  VoidCallback reload;

  MainProps({
    required this.signOut,
    required this.reload,
  });
}

class MainWidget extends StatelessWidget {
  final MainProps props;
  const MainWidget({Key? key, required this.props}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Row(
            children: [
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: 24,
              ),
              const SizedBox(width: 8),
              const Text('LinkHub'),
            ],
          ),
          actions: [
            IconButton(onPressed: props.signOut, icon: const Icon(Icons.logout))
          ],
        ),
        body: const Text('Main...'),
      );
}
