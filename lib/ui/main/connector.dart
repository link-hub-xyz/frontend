import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:linkhub/core/redux/auth/actions.dart';
import 'package:linkhub/core/redux/hubs/actions.dart';
import 'package:linkhub/core/redux/state.dart';

import 'widget.dart';

class MainConnector extends StatelessWidget {
  const MainConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, MainProps>(
        distinct: true,
        onInitialBuild: (props) => props.reload(),
        converter: (store) => MainProps(
          signOut: () => store.dispatch(const SignOutAction()),
          reload: () => store.dispatch(const ReloadHubsAction()),
        ),
        builder: (context, props) => MainWidget(props: props),
      );
}
