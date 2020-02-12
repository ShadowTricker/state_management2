import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:state_management2/containers/redux/actions/fetch_articles.dart';
import 'package:state_management2/containers/redux/actions/set_author.dart';
import 'package:state_management2/containers/redux/models/article_model.dart';
import 'package:state_management2/router/redux_router.dart';
import 'package:state_management2/services/http_service.dart';
import 'package:state_management2/utils/store_main_context_widget.dart';

import 'middleware/fetch_articles_middleware.dart';
import 'reducers/app_state_reducer.dart';
import 'reducers/articles_reducer.dart';
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

    /* ThunkAction<AppState> getArticles(int secondsToWait) {
      return (Store<AppState> store) async {
        final List<Article> articles = await HttpService.getArticles();
        store.dispatch(FetchArticlesSucceedAction(articles));
      };
    } */

    // store.dispatch(getArticles(3));

    /* Future.delayed(Duration(seconds: 3), () {
      print(store.state.articles);
    }); */


    /* final store = new Store(
      appStateReducer, 
      initialState: AppState(), 
      middleware: [fetchArticlesMiddleware],
    );

    // fetchAction(store);
    store.dispatch(FetchArticlesAction());
    store.dispatch(SetAuthorAction('Shadow'));


    // store.dispatch(FetchArticlesAction());
    print(store.state.articles);
    print(store.state.author);
    
    Future.delayed(Duration(seconds: 5), () {
      print(store.state.articles);
      print(store.state.author);
    }); */
    

    /* return ShareMainContextWidget(
      mainContext: mainContext,
      child: MaterialApp(
        title: 'Redux State Management App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/redux-login',
        routes: reduxRoutes(context),
      )
    ); */

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