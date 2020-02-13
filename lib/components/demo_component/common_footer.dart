
import 'package:flutter/material.dart';

class CommonFooter<T> extends StatelessWidget {

  final int commentsLength;
  final int articleId;
  final T item;

  CommonFooter({
    this.commentsLength,
    this.articleId,
    this.item
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
              print(item);
              Navigator.of(context).pushNamed(
                '/redux-details',
                arguments: item
              );
            },
          )
        ],
      ),
    );
  }

}