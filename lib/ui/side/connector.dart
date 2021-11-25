// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:linkhub/core/model/data_status.dart';
// import 'package:linkhub/core/redux/auth/actions.dart';
// import 'package:linkhub/core/redux/hubs/actions.dart';
// import 'package:linkhub/core/redux/state.dart';

// import 'widget.dart';

// class DashboardConnector extends StatelessWidget {
//   const DashboardConnector({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => StoreConnector<AppState, MainProps>(
//         distinct: true,
//         onInitialBuild: (props) {
//           final reload = props.reload;
//           if (reload != null) reload();
//         },
//         converter: (store) => MainProps(
//           signOut: () => store.dispatch(const SignOutAction()),
//           reload: store.state.hubs.status == DataStatus.inProgress
//               ? null
//               : () => store.dispatch(const ReloadHubsAction()),
//           hubs: store.state.hubs.list,
//         ),
//         builder: (context, props) => DashboardWidget(props: props),
//       );
// }
