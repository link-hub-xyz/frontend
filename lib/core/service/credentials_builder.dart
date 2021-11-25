import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

Future<AuthCredential> google() async {
  GoogleSignInAccount? googleUser;
  googleUser = await GoogleSignIn().signInSilently();
  googleUser ??= await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
  if (googleAuth == null) {
    throw 'Can not fetch google authentication.';
  }
  return GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
}

Future<AuthCredential> facebook() async {
  final LoginResult result = await FacebookAuth.instance.login();
  if (result.status == LoginStatus.success) {
    final AccessToken accessToken = result.accessToken!;
    return FacebookAuthProvider.credential(accessToken.token);
  } else {
    throw result.status;
  }
}

Future<AuthCredential> apple() async {
  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  final rawNonce = _generateNonce();
  final nonce = _sha256ofString(rawNonce);

  final appleCredential = await SignInWithApple.getAppleIDCredential(
    scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
    nonce: nonce,
  );

  return OAuthProvider('apple.com').credential(
    idToken: appleCredential.identityToken,
    rawNonce: rawNonce,
  );
}
