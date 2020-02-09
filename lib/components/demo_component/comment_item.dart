import 'package:flutter/material.dart';

import 'common_content.dart';
import 'common_header.dart';

class CommentItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          CommonHeader(
            hideAvatar: true
          ),
          Container(
            padding: EdgeInsets.only(left: 7.0),
            child: CommonContent(),
          ),
          
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.black12
      ),
    );
  }

}