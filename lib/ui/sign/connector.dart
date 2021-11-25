import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:linkhub/core/redux/auth/actions.dart';
import 'package:linkhub/core/redux/state.dart';

import 'widget.dart';

class SignConnector extends StatelessWidget {
  const SignConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, SignProps>(
        distinct: true,
        converter: (store) => SignProps(
          google: () => store.dispatch(const SignInWithGoogleAction()),
        ),
        builder: (context, props) => SignWidget(props: props),
      );
}
