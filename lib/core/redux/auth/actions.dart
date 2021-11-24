import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../actions.dart';

@immutable
class SignInWithAppleAction {
  /*
  Credential to merge with.
  */
  final AuthCredential? credential;
  const SignInWithAppleAction({this.credential});
}

@immutable
class SignInWithFacebookAction {
  /*
  Credential to merge with.
  */
  final AuthCredential? credential;
  const SignInWithFacebookAction({this.credential});
}

@immutable
class SignInWithGoogleAction {
  /*
  Credential to merge with.
  */
  final AuthCredential? credential;
  const SignInWithGoogleAction({this.credential});
}

@immutable
class DidSignInAction {
  final User user;

  const DidSignInAction({
    required this.user,
  });

  @override
  String toString() => 'User: $user';
}

@immutable
class SignOutAction {
  const SignOutAction();
}

@immutable
class DidSignOutAction {
  const DidSignOutAction();
}

abstract class FailureAuthAction extends FailureAction {
  final AuthError error;
  const FailureAuthAction({
    String? reason,
    required this.error,
  }) : super(reason);
}

class AuthError {
  final String? description;
  const AuthError({this.description});
}

@immutable
class DidFailSignInAction implements FailureAuthAction {
  @override
  final AuthError error;

  @override
  String? get reason => error.description;

  const DidFailSignInAction({
    required this.error,
  });

  @override
  String toString() => 'Reason: $error';
}
