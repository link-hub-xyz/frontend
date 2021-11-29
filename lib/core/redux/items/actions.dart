import 'package:flutter/foundation.dart';
import 'package:linkhub/core/model/item.dart';
import 'package:linkhub/core/redux/actions.dart';

@immutable
class CreateItemAction {
  final String hubId;
  final String url;

  const CreateItemAction({
    required this.hubId,
    required this.url,
  });
}

@immutable
class CreatingItemAction {
  const CreatingItemAction();
}

@immutable
class DidCreateItemAction {
  final String id;
  final Item item;

  const DidCreateItemAction({
    required this.id,
    required this.item,
  });
}

@immutable
class DidFailCreateItemAction extends FailureAction {
  const DidFailCreateItemAction({required reason}) : super(reason);
}
