import 'package:flutter/material.dart';

class DownwardDataPage extends StatelessWidget {

  final String text;

  DownwardDataPage({ @required this.text });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Downward Data Flow'),
        centerTitle: true,
      ),
      body: _buildPageContainer(text + '1')
    );
  }

  Widget _buildPageContainer(String displayText) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(
            'Page: $displayText',
            style: TextStyle(
              fontSize: 16.0
            )
          ),
          _buildOuterContainer(displayText + '2')
        ],
      )
    );
  }

  Widget _buildOuterContainer(String displayText) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            'Outer: $displayText',
            style: TextStyle(
              fontSize: 16.0
            )
          ),
          _buildInnerContainer(displayText + '3')
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.black26
        )
      ),
    );
  }

  Widget _buildInnerContainer(String displayText) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            'Inner: $displayText',
            style: TextStyle(
              fontSize: 16.0
            )
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.black26
        )
      ),
    );
  }
}