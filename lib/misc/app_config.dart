import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkhub/core/redux/service/firebase_service.dart';
import 'package:linkhub/core/redux/service/service.dart';
import 'package:linkhub/core/redux/middleware.dart';
import 'package:linkhub/misc/app_assembler.dart';
import 'package:linkhub/ui/root/widget.dart';
import 'package:linkhub/ui/sign/connector.dart';
import 'package:linkhub/core/redux/reducer.dart';
import 'package:linkhub/core/redux/state.dart';

enum Environment {
  development,
  production,
}

class AppConfig {
  final Environment environment;

  AppConfig({
    required this.environment,
  });

  Future run() async {
    WidgetsFlutterBinding.ensureInitialized();
    AppAssembler().assemble(GetIt.instance);

    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('google_fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });

    final store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
      middleware: appMiddleware,
    );

    ServiceBuilder<AppState>()
      ..service(FirebaseService())
      // ..service(GraphQLService(environment: environment))
      ..build().bootstrup(store);

    runApp(
      StoreProvider(
        store: store,
        child: LinkHubApp(),
      ),
    );
  }
}

final navigatorKey = GlobalKey<NavigatorState>();

@immutable
class LinkHubApp extends StatelessWidget {
  final ThemeData theme = ThemeData();

  LinkHubApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorKey: navigatorKey,
        title: 'LinkHub',
        theme: theme.copyWith(
          textTheme: GoogleFonts.notoSansTextTheme(),
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.deepOrange,
            secondary: Colors.deepPurpleAccent,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: GoogleFonts.notoSansTextTheme().headline4?.copyWith(
                  fontSize: 21.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/sign',
        routes: {
          '/': (context) => const RootWidget(),
          '/sign': (context) => const SignConnector(),
        },
      );
}
