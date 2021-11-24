import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../action_creators.dart';

class SignInActionCreator {
  final ActionCreator<LoginStatus> facebook;
  final ActionCreator<FirebaseAuthException> firebase;
  final ActionCreator<Object> undefined;

  const SignInActionCreator({
    required this.facebook,
    required this.firebase,
    required this.undefined,
  });
}
