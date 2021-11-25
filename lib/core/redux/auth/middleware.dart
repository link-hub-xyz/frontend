import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:linkhub/core/redux/actions.dart';
import 'package:redux/redux.dart';
import 'package:get_it/get_it.dart';
import 'package:linkhub/core/service/credentials_builder.dart'
    // ignore: library_prefixes
    as CredentialsBuilder;
import '../action_creators.dart';
import '../state.dart';
import 'actions.dart';

void _signInWithApple<State>(
  Store<State> store,
  SignInWithAppleAction action,
  NextDispatcher next,
) async {
  next(action);
  // final actionCreators = GetIt.instance.get<ActionCreators>();
  // try {
  //   final credential = await FirebaseAuth.instance.signInWithCredential(
  //     await CredentialsBuilder.apple(),
  //   );
  //   if (action.credential != null)
  //     await credential.user!.linkWithCredential(action.credential!);
  // } on FirebaseAuthException catch (e) {
  //   return next(await actionCreators.signIn.firebase(e));
  // } catch (e) {
  //   return next(actionCreators.signIn.undefined(e));
  // }
}

void _signInWithFacebook<State>(
  Store<State> store,
  SignInWithFacebookAction action,
  NextDispatcher next,
) async {
  next(action);
  // final actionCreators = GetIt.instance.get<ActionCreators>();
  // try {
  //   final credential = await FirebaseAuth.instance.signInWithCredential(
  //     await CredentialsBuilder.facebook(),
  //   );
  //   if (action.credential != null)
  //     await credential.user!.linkWithCredential(action.credential!);
  // } on LoginStatus catch (e) {
  //   final action = await actionCreators.signIn.facebook(e);
  //   if (action != null) return next(action);
  // } on FirebaseAuthException catch (e) {
  //   return next(await actionCreators.signIn.firebase(e));
  // } catch (e) {
  //   return next(actionCreators.signIn.undefined(e));
  // }
}

void _signInWithGogle<State>(
  Store<State> store,
  SignInWithGoogleAction action,
  NextDispatcher next,
) async {
  next(action);
  final actionCreators = GetIt.instance.get<ActionCreators>();
  try {
    final credential = await FirebaseAuth.instance.signInWithCredential(
      await CredentialsBuilder.google(),
    );

    if (action.credential != null) {
      await credential.user!.linkWithCredential(action.credential!);
    }
  } on FirebaseAuthException catch (e) {
    next(await actionCreators.signIn.firebase(e));
  } on PlatformException catch (e) {
    switch (e.code) {
      case 'popup_blocked_by_browser':
        next(
          const AlertAction(
              reason: "Pop-up has been blocked.\nPlease, try once again."),
        );
    }
  } catch (e) {
    next(actionCreators.signIn.undefined(e));
  }
}

void _signOutMiddleware<State>(
  Store<State> store,
  SignOutAction action,
  NextDispatcher next,
) {
  next(action);
  try {
    FirebaseAuth.instance.signOut();
  } catch (e) {
    print('Did Fail sign out: $e');
  }
}

final List<Middleware<AppState>> authMiddlewares = [
  TypedMiddleware<AppState, SignInWithAppleAction>(_signInWithApple),
  TypedMiddleware<AppState, SignInWithFacebookAction>(_signInWithFacebook),
  TypedMiddleware<AppState, SignInWithGoogleAction>(_signInWithGogle),
  TypedMiddleware<AppState, SignOutAction>(_signOutMiddleware),
];
