import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_models/articles_bloc.dart';
import 'bloc_models/author_bloc.dart';
import 'bloc_models/comments_bloc.dart';
import 'events/articles_event.dart';
import 'events/comments_event.dart';

class ManagementBlocInputPage extends StatelessWidget {

  final Map<String, dynamic> arguments;
  final TextEditingController _itemController = TextEditingController();

  ManagementBlocInputPage({ @required this.arguments });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add ${ arguments['pageType'] }',
        ),
        centerTitle: true,
      ),
      body: _buildBody(context)
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          commentInput(),
          buttonArea(context)
        ],
      ),
    );
  }

  Widget commentInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Form(
        autovalidate: true,
        child: TextFormField(
          controller: _itemController,
          autofocus: false,
          maxLines: 8,
          maxLength: arguments['pageType'] == 'Article' ? 1000 : 100,
          maxLengthEnforced: true,
          decoration: InputDecoration(
            hintText: 'Input your ${ arguments['pageType'].toLowerCase() }',
          ),
          validator: (v) {
            if (v.trim().isEmpty) {
              return 'Empty';
            }
            return null;
          }
        ),
      )
    );
  }

  Widget buttonArea(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52.0,
      child: InkWell(
        child: Center(
          child: Text('Submit', style: TextStyle(
            color: Colors.white,
            fontSize: 20.0
          )),
        ),
        onTap: () {
          final Map<String, dynamic> newItem = {
            'author': BlocProvider.of<AuthorBloc>(context).state.author,
            'content': _itemController.text,
            if (arguments['pageType'] == 'Article') 'title': '临时添加',
            if (arguments['pageType'] == 'Comment') 'articleId': arguments['articleId']
          };
          if (arguments['pageType'] == 'Article') {
            BlocProvider.of<ArticlesBloc>(context).add(AddArticle(newItem: newItem));
          }
          else {
            BlocProvider.of<CommentsBloc>(context).add(AddComment(newItem: newItem));
          }
          Navigator.of(context).pop(true);
        },
      ),
      decoration: BoxDecoration(
        color: Colors.blue
      ),
    );
  }

}