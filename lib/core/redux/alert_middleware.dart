import 'package:linkhub/core/redux/actions.dart';
import 'package:linkhub/core/redux/state.dart';
import 'package:redux/redux.dart';

final failureMiddleware =
    TypedMiddleware<AppState, FailureAction>(_failureMiddleware);

void _failureMiddleware<State>(
  Store<State> store,
  FailureAction action,
  NextDispatcher next,
) {
  next(action);
  next(AlertAction(reason: action.reason));
}
