import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RootWidget extends StatelessWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Row(
            children: [
              SvgPicture.asset(
                'images/logo.svg',
                width: 24,
              ),
              const SizedBox(width: 8),
              const Text('LinkHub'),
            ],
          ),
        ),
        body: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      );
}
