import 'auth/action_creators.dart';

typedef ActionCreator<T> = dynamic Function(T);

class ActionCreators {
  final SignInActionCreator signIn;

  const ActionCreators({
    required this.signIn,
  });
}
