import 'package:flutter/material.dart';
import 'package:state_management2/containers/bloc/management_bloc_articles.dart';
import 'package:state_management2/containers/bloc/management_bloc_comments.dart';
import 'package:state_management2/containers/bloc/management_bloc_input.dart';
import 'package:state_management2/containers/bloc/management_bloc_login.dart';

Map<String, WidgetBuilder> blocRoutes(BuildContext context) {
  return {
    '/bloc-login': (context) => ManagementBlocLoginPage(),
    '/bloc-articles': (context) => ManagementBlocArticlesPage(),
    '/bloc-details': (context) => ManagementBlocCommentsPage(
      ModalRoute.of(context).settings.arguments
    ),
    '/bloc-submit': (context) => ManagementBlocInputPage(
      arguments: ModalRoute.of(context).settings.arguments,
    ),
  };
}