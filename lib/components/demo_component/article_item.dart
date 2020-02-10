
import 'package:flutter/material.dart';
import 'package:state_management2/containers/redux/models/article_model.dart';

import 'common_content.dart';
import 'common_footer.dart';
import 'common_header.dart';

class ArticleItem extends StatelessWidget {

  ArticleItem(this.article);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 10.0, right: 20.0, left: 10.0),
      child: Column(
        children: <Widget>[
          CommonHeader(userName: article.author, updateTime: article.updateTime),
          CommonContent(content: article.content),
          CommonFooter(commentsLength: article.commentsLength, articleId: article.articleId)
        ],
      ),
    );
  }

}