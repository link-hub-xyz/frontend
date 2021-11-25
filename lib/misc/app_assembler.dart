import 'package:get_it/get_it.dart';
import 'package:linkhub/core/api/assembler.dart';
import 'package:linkhub/core/redux/action_creators_assembler.dart';
import 'package:linkhub/core/service/assembler.dart';
import 'package:linkhub/misc/app_config.dart';
import 'package:linkhub/misc/router_assembler.dart';

class AppAssembler implements Assebmbler {
  Environment environment;

  AppAssembler({required this.environment}) : super();

  @override
  Future assemble(GetIt locator) async {
    await ActionsCreatorAssembler().assemble(locator);
    RouterAssembler().assemble(locator);
    ApiAssembler(environment: environment).assemble(locator);
  }
}
