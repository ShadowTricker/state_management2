import 'package:flutter/material.dart';
import 'package:state_management2/router/redux_router.dart';
import 'package:state_management2/utils/store_main_context_widget.dart';

class ReduxApp extends StatelessWidget {

  ReduxApp({
    @required this.mainContext
  });

  final BuildContext mainContext;

  @override
  Widget build(BuildContext context) {

    return ShareMainContextWidget(
      mainContext: mainContext,
      child: MaterialApp(
        title: 'Redux State Management App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/redux-login',
        routes: reduxRoutes(context),
      )
    );
  }

}