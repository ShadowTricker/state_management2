
import 'package:flutter/material.dart';

class CommonContent extends StatelessWidget {

  CommonContent({
    this.content
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        content,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black
        ),
        maxLines: 10,
        overflow: TextOverflow.ellipsis,
      )
    );
  }

}