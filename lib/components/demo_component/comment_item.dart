import 'package:flutter/material.dart';
import 'package:state_management2/containers/redux/models/comment_model.dart';

import 'common_content.dart';
import 'common_header.dart';

class CommentItem extends StatelessWidget {

  final Comment comment;
  
  CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          CommonHeader(
            hideAvatar: true,
            userName: comment.author,
            updateTime: comment.updateTime,
          ),
          Container(
            padding: EdgeInsets.only(left: 7.0),
            child: CommonContent(content: comment.comment),
          ),
          
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.black12
      ),
    );
  }

}