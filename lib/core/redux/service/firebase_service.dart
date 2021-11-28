import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:linkhub/core/redux/auth/actions.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:redux/redux.dart';
import '../state.dart';
import 'service.dart';

class FirebaseService implements Service<AppState> {
  @override
  Future<void> bootstrup(Store<AppState> store) async {
    await Firebase.initializeApp();

    _bootstrupAnalytics();

    _bootstrupAuth(FirebaseAuth.instance, store);
    // _setupCrashlytics();
  }

  Future _bootstrupAnalytics() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    await FirebaseAnalytics().logAppOpen();
    await FirebaseAnalytics().setUserProperty(
      name: 'app_version',
      value: packageInfo.version,
    );
  }

  // Future<void> _setupCrashlytics() async {
  //   await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  //   final Function? originalOnError = FlutterError.onError;
  //   FlutterError.onError = (FlutterErrorDetails errorDetails) async {
  //     await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
  //     originalOnError!(errorDetails);
  //   };
  // }

  // void _bootstrupMessaging(FirebaseMessaging messaging) async {
  //   await messaging.requestPermission(
  //     alert: true,
  //     announcement: false,
  //     badge: true,
  //     carPlay: false,
  //     criticalAlert: false,
  //     provisional: false,
  //     sound: true,
  //   );

  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     print('Got a message whilst in the foreground!');
  //     print('Message data: ${message.data}');

  //     if (message.notification != null) {
  //       print('Message also contained a notification: ${message.notification}');
  //     }
  //   });

  //   FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
  //     print('Got a message whilst in the background!');
  //     print('Message data: ${message.data}');
  //   });
  // }

  // final _converter = AuthProviderConverter();

  void _bootstrupAuth(FirebaseAuth auth, Store<AppState> store) {
    auth.authStateChanges().listen((User? user) async {
      if (user == null && store.state.auth.isAuthorised) {
        store.dispatch(const DidSignOutAction());
        await FirebaseAnalytics().logEvent(name: 'sign_out');
        await FirebaseAnalytics().setUserId(null);
        await FirebaseAnalytics().resetAnalyticsData();
        return;
      }

      if (user != null) {
        // FirebaseCrashlytics.instance.setUserIdentifier(user.uid);
        // final providers = user.providerData
        //     .map((provider) => provider.providerId)
        //     .map(_converter.convertFromString)
        //     .toList();
        // store.dispatch(DidReloadAuthProvidersList(providers: providers));
        await FirebaseAnalytics().setUserId(user.uid);
        await FirebaseAnalytics().logLogin(
          loginMethod: user.providerData.isNotEmpty
              ? user.providerData.first.providerId
              : 'undefined',
        );
        store.dispatch(DidSignInAction(user: user));
        return;
      }
    });
  }
}
