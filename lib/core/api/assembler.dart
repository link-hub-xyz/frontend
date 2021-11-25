import 'package:artemis/client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:linkhub/core/service/assembler.dart';
import 'package:linkhub/misc/app_config.dart';

import 'client.dart';

class ApiAssembler implements Assebmbler {
  final Environment environment;

  const ApiAssembler({required this.environment});

  @override
  Future assemble(GetIt locator) {
    final _client = Client(tokenProvider: () async {
      return await FirebaseAuth.instance.currentUser?.getIdToken();
    });

    switch (environment) {
      case Environment.development:
        locator.registerSingleton<ArtemisClient>(
          ArtemisClient(
            'http://localhost:5000/api/graphql',
            httpClient: _client,
          ),
        );
        break;

      case Environment.production:
        locator.registerSingleton<ArtemisClient>(
          ArtemisClient(
            'https://linkhub-564ef.web.app/api/graphql',
            httpClient: _client,
          ),
        );
        break;
    }
    return Future.value();
  }
}
