import 'package:linkhub/core/model/auth_provider.dart';

const String _apple = 'apple.com';
const String _google = 'google.com';
const String _facebook = 'facebook.com';
const String _email = 'password';
const String _phone = 'phone';

class AuthProviderConverter {
  AuthProvider? convertFromString(String raw) {
    switch (raw) {
      case _apple:
        return AuthProvider.apple;
      case _email:
        return AuthProvider.email;
      case _facebook:
        return AuthProvider.facebook;
      case _google:
        return AuthProvider.google;
      case _phone:
        return AuthProvider.phone;
    }
    return null;
  }

  String? convertToString(AuthProvider provider) {
    switch (provider) {
      case AuthProvider.apple:
        return _apple;
      case AuthProvider.email:
        return _email;
      case AuthProvider.facebook:
        return _facebook;
      case AuthProvider.google:
        return _google;
      case AuthProvider.phone:
        return _phone;
    }
  }
}
