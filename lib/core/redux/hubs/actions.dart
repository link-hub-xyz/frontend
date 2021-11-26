import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:linkhub/core/model/hub.dart';
import 'package:linkhub/core/model/item.dart';
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
  final Map<String, Item> items;

  const DidReloadHubsAction({
    required this.hubs,
    required this.items,
  });
}

@immutable
class DidFailReloadHubsAction extends FailureAction {
  const DidFailReloadHubsAction({required reason}) : super(reason);
}
