import 'package:linkhub/core/redux/analytics/reducer.dart';

import 'auth/reducer.dart';
import 'hubs/reducer.dart';
import 'items/reducer.dart';
import 'state.dart';

AppState appReducer(AppState state, dynamic action) => AppState(
      auth: authReducer(state.auth, action),
      hubs: hubsReducer(state.hubs, action),
      items: itemsReducer(state.items, action),
      analytics: analyticsReducer(state.analytics, action),
    );
