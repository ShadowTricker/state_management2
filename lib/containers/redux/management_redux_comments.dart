import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_management2/components/demo_component/comment_item.dart';
import 'package:state_management2/components/demo_component/common_content.dart';
import 'package:state_management2/components/demo_component/common_header.dart';
import 'package:state_management2/containers/redux/actions/add_comment.dart';
import 'package:state_management2/containers/redux/actions/fetch_comments.dart';
import 'package:state_management2/containers/redux/models/article_model.dart';
import 'package:state_management2/containers/redux/store/app_state.dart';

import 'models/comment_model.dart';

class ManagementReduxCommentsPage extends StatefulWidget {

  ManagementReduxCommentsPage(this.article);

  final Article article;

  @override
  _ManagementReduxCommentsPageState createState() => _ManagementReduxCommentsPageState();

}

class _ManagementReduxCommentsPageState extends State<ManagementReduxCommentsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              final Map<String, dynamic> arguments = {
                'pageType': 'Comment',
                'articleId': widget.article.articleId
              };
              Navigator.of(context).pushNamed(
                '/redux-submit',
                arguments: arguments
              );
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

    return StoreConnector<AppState, List<Comment>>(
      onInit: (store) => store.dispatch(getComments(widget.article.articleId)),
      converter: (store) => store.state.comments,
      builder: (context, comments) {
        print(comments);
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