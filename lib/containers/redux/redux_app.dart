import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:state_management2/router/redux_router.dart';
import 'package:state_management2/utils/store_main_context_widget.dart';

import 'reducers/app_state_reducer.dart';
import 'store/app_state.dart';

class ReduxApp extends StatelessWidget {

  ReduxApp({
    @required this.mainContext
  });

  final BuildContext mainContext;

  @override
  Widget build(BuildContext context) {

    final store = Store<AppState>(
      appStateReducer,
      initialState: AppState(),
      middleware: [thunkMiddleware, LoggingMiddleware.printer()]
    );

    return StoreProvider(
      store: store,
      child: ShareMainContextWidget(
        mainContext: mainContext,
        child: MaterialApp(
          title: 'Redux State Management App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/redux-login',
          routes: reduxRoutes(context),
        )
      ),
    );
  }

}