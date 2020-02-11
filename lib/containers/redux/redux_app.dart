import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:state_management2/containers/redux/actions/fetch_articles.dart';
import 'package:state_management2/router/redux_router.dart';
import 'package:state_management2/utils/store_main_context_widget.dart';

import 'middleware/fetch_articles_middleware.dart';
import 'reducers/articles_reducer.dart';
import 'store/app_state.dart';

class ReduxApp extends StatelessWidget {

  ReduxApp({
    @required this.mainContext
  });

  final BuildContext mainContext;

  @override
  Widget build(BuildContext context) {

    final store = new Store(
      articleReducer, 
      initialState: AppState(), 
      middleware: [fetchArticlesMiddleware],
    );

    store.dispatch(FetchArticlesAction());

    print(store.state.isFetching);
    print(store.state.articles);
    
    Future.delayed(Duration(seconds: 3), () {
      print(store.state.isFetching);
      print(store.state.articles);
    });
    

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