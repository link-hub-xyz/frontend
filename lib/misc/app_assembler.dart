import 'package:get_it/get_it.dart';
import 'package:linkhub/core/redux/action_creators_assembler.dart';
import 'package:linkhub/core/service/assembler.dart';

class AppAssembler implements Assebmbler {
  @override
  Future assemble(GetIt locator) async {
    await ActionsCreatorAssembler().assemble(locator);
  }
}
