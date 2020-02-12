import 'package:flutter/material.dart';
import 'package:state_management2/containers/redux/management_redux_articles.dart';
import 'package:state_management2/containers/redux/management_redux_comments.dart';
import 'package:state_management2/containers/redux/management_redux_input.dart';
import 'package:state_management2/containers/redux/management_redux_login.dart';

Map<String, WidgetBuilder> reduxRoutes(BuildContext context) {
  return {
    '/redux-login': (context) => ManagementReduxLoginPage(),
    '/redux-articles': (context) => ManagementReduxArticlesPage(
      // ModalRoute.of(context).settings.arguments
    ),
    '/redux-details': (context) => ManagementReduxCommentsPage(),
    '/redux-submit': (context) => ManagementReduxInputPage(
      pageType: ModalRoute.of(context).settings.arguments,
    ),
  };
}