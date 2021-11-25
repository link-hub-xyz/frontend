import 'package:redux/redux.dart';
import 'actions.dart';
import 'state.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, DidSignInAction>(_signIn),
  TypedReducer<AuthState, DidSignOutAction>(_signOut),
]);

AuthState _signIn(AuthState state, DidSignInAction action) => AuthState(
      id: action.user.uid,
      isAuthorised: true,
    );

AuthState _signOut(AuthState state, DidSignOutAction action) =>
    AuthState.initial();
