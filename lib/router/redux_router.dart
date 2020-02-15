import 'package:flutter/material.dart';
import 'package:state_management2/containers/redux/management_redux_articles.dart';
import 'package:state_management2/containers/redux/management_redux_comments.dart';
import 'package:state_management2/containers/redux/management_redux_input.dart';
import 'package:state_management2/containers/redux/management_redux_login.dart';

Map<String, WidgetBuilder> reduxRoutes(BuildContext context) {
  return {
    '/redux-login': (context) => ManagementReduxLoginPage(),
    '/redux-articles': (context) => ManagementReduxArticlesPage(),
    '/redux-details': (context) => ManagementReduxCommentsPage(
      ModalRoute.of(context).settings.arguments
    ),
    '/redux-submit': (context) => ManagementReduxInputPage(
      arguments: ModalRoute.of(context).settings.arguments,
    ),
  };
}