import 'package:get_it/get_it.dart';
import 'package:linkhub/core/service/assembler.dart';
import 'package:linkhub/core/redux/auth/sign_in_action_creators.dart'
    as sign_in_action_creator;

import 'action_creators.dart';
import 'auth/action_creators.dart';

class ActionsCreatorAssembler implements Assebmbler {
  @override
  Future assemble(GetIt locator) {
    locator.registerSingleton<ActionCreators>(
      const ActionCreators(
        signIn: SignInActionCreator(
          facebook: sign_in_action_creator.facebook,
          firebase: sign_in_action_creator.firebase,
          undefined: sign_in_action_creator.undefined,
        ),
      ),
    );
    return Future.value();
  }
}
