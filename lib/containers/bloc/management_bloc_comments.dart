import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management2/components/demo_component/comment_item.dart';
import 'package:state_management2/components/demo_component/common_content.dart';
import 'package:state_management2/components/demo_component/common_header.dart';
import 'package:state_management2/containers/bloc/events/comments_event.dart';
import 'package:state_management2/containers/bloc/states/comments_state.dart';
import 'package:state_management2/models/common/models/article_model.dart';
import 'package:state_management2/models/common/models/comment_model.dart';

import 'bloc_models/comments_bloc.dart';

class ManagementBlocCommentsPage extends StatefulWidget {

  ManagementBlocCommentsPage(this.article);

  final Article article;

  @override
  _ManagementBlocCommentsPageState createState() => _ManagementBlocCommentsPageState();

}

class _ManagementBlocCommentsPageState extends State<ManagementBlocCommentsPage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CommentsBloc>(context)
      .add(GetComments(articleId: widget.article.articleId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final Map<String, dynamic> arguments = {
                'pageType': 'Comment',
                'articleId': widget.article.articleId
              };
              await Navigator.of(context).pushNamed(
                '/bloc-submit',
                arguments: arguments
              );
              BlocProvider.of<CommentsBloc>(context)
                .add(GetComments(articleId: widget.article.articleId));
            },
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      width: double.infinity,
      child: ListView(
        padding: EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0, bottom: 30.0),
        shrinkWrap: true,
        children: <Widget>[
          CommonHeader(userName: widget.article.author, updateTime: widget.article.updateTime),
          CommonContent(content: widget.article.content),
          _buildComments(),
        ],
      )
    );
  }

  Widget _buildComments() {
    return BlocBuilder<CommentsBloc, CommentsState>(
      builder: (context, state) {
        final List<Comment> comments = state.comments;
        return ListView.separated(
          shrinkWrap: true,
          itemCount: comments.length,
          itemBuilder: (context, int index) {
            return CommentItem(comments[index]);
          },
          separatorBuilder: (context, int index) => Divider(
            height: .5,
            color: Colors.black38
          ),
        );
      },
    );
  }
}