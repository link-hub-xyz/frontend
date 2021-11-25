import 'package:flutter/foundation.dart';
import 'package:linkhub/core/model/hub.dart';
import 'package:linkhub/core/redux/actions.dart';

@immutable
class ReloadHubsAction {
  const ReloadHubsAction();
}

@immutable
class ReloadingHubsAction {
  const ReloadingHubsAction();
}

@immutable
class DidReloadHubsAction {
  final List<Hub> hubs;
  const DidReloadHubsAction({required this.hubs});
}

@immutable
class DidFailReloadHubsAction extends FailureAction {
  const DidFailReloadHubsAction({required reason}) : super(reason);
}
