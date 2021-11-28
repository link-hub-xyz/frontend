import 'package:flutter/foundation.dart';

abstract class FailureAction {
  final String? reason;
  const FailureAction(this.reason);
}

@immutable
class AlertAction {
  final String? reason;
  const AlertAction({required this.reason});
}
