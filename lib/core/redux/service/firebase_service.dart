import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:linkhub/core/redux/auth/actions.dart';
import 'package:redux/redux.dart';
import '../state.dart';
import 'service.dart';

class FirebaseService implements Service<AppState> {
  @override
  Future<void> bootstrup(Store<AppState> store) async {
    await Firebase.initializeApp();

    _bootstrupAuth(FirebaseAuth.instance, store);
    // _setupCrashlytics();
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
    auth.authStateChanges().listen((User? user) {
      if (user == null && store.state.auth.isAuthorised) {
        store.dispatch(const DidSignOutAction());
        return;
      }

      if (user != null) {
        // FirebaseCrashlytics.instance.setUserIdentifier(user.uid);
        // final providers = user.providerData
        //     .map((provider) => provider.providerId)
        //     .map(_converter.convertFromString)
        //     .toList();
        // store.dispatch(DidReloadAuthProvidersList(providers: providers));

        store.dispatch(DidSignInAction(user: user));
        return;
      }
    });
  }
}
