import 'package:state_management2/containers/redux/reducers/author_reducer.dart';
import 'package:state_management2/containers/redux/store/app_state.dart';

import 'articles_reducer.dart';

AppState appStateReducer(AppState state, action) => AppState(
  author: authorReducer(state.author, action),
  articles: articlesReducer(state.articles, action),
);