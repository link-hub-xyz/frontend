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

@immutable
class CreateHubAction {
  final String name;
  const CreateHubAction({required this.name});
}

@immutable
class CreatingHubAction {
  const CreatingHubAction();
}

@immutable
class DidCreateHubAction {
  final Hub hub;
  final Map<String, Item> items;

  const DidCreateHubAction({
    required this.hub,
    required this.items,
  });
}

@immutable
class DidFailCreateHubAction extends FailureAction {
  const DidFailCreateHubAction({required reason}) : super(reason);
}
