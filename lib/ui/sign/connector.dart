import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:linkhub/core/redux/auth/actions.dart';
import 'package:linkhub/core/redux/state.dart';
import 'package:linkhub/misc/app_router.dart';

import 'widget.dart';

// ignore: must_be_immutable
class SignConnector extends StatelessWidget {
  SignConnector({Key? key}) : super(key: key);
  bool _isPushed = false;
  @override
  Widget build(BuildContext context) => StoreConnector<AppState, SignProps>(
        distinct: true,
        converter: (store) => SignProps(
          isAuthorised: store.state.auth.isAuthorised,
          google: () => store.dispatch(const SignInWithGoogleAction()),
        ),
        onDidChange: (old, current) {
          /*
          I used to track auth routing globally, in navigation_middleware
          But we only need to handle routing to main flow during auth.

          (Deep links must be ignored.)

           */
          if (current.isAuthorised == true && _isPushed == false) {
            context.router.replace(const MainWidgetRoute());
            _isPushed = true;
          }
        },
        builder: (context, props) => SignWidget(props: props),
      );
}
