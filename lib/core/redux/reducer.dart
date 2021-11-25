import 'auth/reducer.dart';
import 'hubs/reducer.dart';
import 'state.dart';

AppState appReducer(AppState state, dynamic action) => AppState(
      auth: authReducer(state.auth, action),
      hubs: hubsReducer(state.hubs, action),
    );
