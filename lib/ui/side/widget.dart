import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SideWidget extends StatelessWidget {
  const SideWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 200,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
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
            ),
            body: Column(
              children: const [
                Spacer(),
                ListTile(
                  title: Text('Log out'),
                )
              ],
            )),
      );
}
