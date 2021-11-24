import 'package:linkhub/misc/app_config.dart';

void main() async {
  await AppConfig(
    environment: Environment.development,
  ).run();
}
