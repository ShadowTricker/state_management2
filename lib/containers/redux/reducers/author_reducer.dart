import 'package:redux/redux.dart';
import 'package:state_management2/containers/redux/actions/set_author.dart';

String setAuthorReducer(String author, SetAuthorAction action) {
  return action.author;
}

Reducer<String> authorReducer = combineReducers<String>([
  TypedReducer<String, SetAuthorAction>(setAuthorReducer)
]);