import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SideProps {
  final VoidCallback? dashboard;
  final VoidCallback? analytics;
  final VoidCallback? profile;
  final VoidCallback signOut;

  SideProps({
    required this.dashboard,
    required this.analytics,
    required this.profile,
    required this.signOut,
  });
}

class SideWidget extends StatelessWidget {
  final SideProps props;
  const SideWidget({Key? key, required this.props}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 256,
        child: Scaffold(
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
            ),
            body: Column(
              children: [
                ListTile(
                  onTap: props.dashboard,
                  selected: props.dashboard == null,
                  title: const Text('Dashboard'),
                  leading: Icon(
                    Icons.dashboard_outlined,
                    color: props.dashboard != null
                        ? Theme.of(context).textTheme.button?.color
                        : null,
                  ),
                ),
                ListTile(
                  onTap: props.analytics,
                  selected: props.analytics == null,
                  title: const Text('Analytics'),
                  leading: Icon(
                    Icons.insights_outlined,
                    color: props.analytics != null
                        ? Theme.of(context).textTheme.button?.color
                        : null,
                  ),
                ),
                ListTile(
                  onTap: props.profile,
                  selected: props.profile == null,
                  title: const Text('Profile'),
                  leading: Icon(
                    Icons.person_outlined,
                    color: props.profile != null
                        ? Theme.of(context).textTheme.button?.color
                        : null,
                  ),
                ),
                const Spacer(),
                ListTile(
                  onTap: props.signOut,
                  leading: Icon(
                    Icons.logout_outlined,
                    color: Theme.of(context).textTheme.button?.color,
                  ),
                  title: const Text('Sign out'),
                ),
              ],
            )),
      );
}
