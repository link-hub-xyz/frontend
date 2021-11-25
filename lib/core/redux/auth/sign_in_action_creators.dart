import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'actions.dart';

dynamic facebook(LoginStatus e) {
  switch (e) {
    case LoginStatus.operationInProgress:
      return const DidFailSignInAction(
          error: AuthError(
              description: 'You have a previous login operation in progress'));

    case LoginStatus.failed:
      return const DidFailSignInAction(
          error: AuthError(description: 'Login failed'));

    default:
      return null;
  }
}

dynamic firebase(FirebaseAuthException e) {
  switch (e.code) {
    case 'user-not-found':
    case 'invalid-email':
      return DidFailSignInAction(error: AuthError(description: e.message));

    case 'wrong-password':
      return const DidFailSignInAction(
          error: AuthError(description: 'Wrong password'));

    case 'invalid-credential':
      return const DidFailSignInAction(
          error: AuthError(description: 'Smth went wrong'));

    default:
      return DidFailSignInAction(error: AuthError(description: e.message));
  }
}

dynamic undefined(e) {
  return const DidFailSignInAction(
    error: AuthError(description: 'Smth went wrong'),
  );
}
