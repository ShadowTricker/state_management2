
import 'package:flutter/material.dart';

class CommonFooter<T> extends StatelessWidget {

  final int commentsLength;
  final int articleId;
  final T item;
  final String appType;

  CommonFooter({
    this.commentsLength,
    this.articleId,
    this.item,
    this.appType
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsetsDirectional.only(bottom: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$commentsLength Comments',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 15.0
            )
          ),
          InkWell(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.more_horiz,
                  color: Colors.black54,
                  size: 20.0
                ),
              ],
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                '/$appType-details',
                arguments: item
              );
            },
          )
        ],
      ),
    );
  }

}