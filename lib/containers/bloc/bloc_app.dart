import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management2/containers/bloc/bloc_models/articles_bloc.dart';
import 'package:state_management2/containers/bloc/bloc_models/author_bloc.dart';
import 'package:state_management2/containers/bloc/bloc_models/comments_bloc.dart';
import 'package:state_management2/router/bloc_router.dart';
import 'package:state_management2/utils/store_main_context_widget.dart';

class BlocApp extends StatelessWidget {

  BlocApp({
    @required this.mainContext
  });

  final BuildContext mainContext;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthorBloc>(
          create: (context) => AuthorBloc(),
        ),
        BlocProvider<ArticlesBloc>(
          create: (context) => ArticlesBloc(),
        ),
        BlocProvider<CommentsBloc>(
          create: (context) => CommentsBloc(),
        ),
      ],
      child: ShareMainContextWidget(
        mainContext: mainContext,
        child: MaterialApp(
            title: 'Bloc State Management App',
            theme: ThemeData(
              primaryColor: Colors.blue,
            ),
            initialRoute: '/bloc-login',
            routes: blocRoutes(context),
          )
        ),
      );
  }

}