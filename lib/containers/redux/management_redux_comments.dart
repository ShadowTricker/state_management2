import 'package:flutter/material.dart';
import 'package:state_management2/components/demo_component/comment_item.dart';
import 'package:state_management2/components/demo_component/common_content.dart';
import 'package:state_management2/components/demo_component/common_header.dart';

class ManagementReduxCommentsPage extends StatefulWidget {

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
              Navigator.of(context).pushNamed(
                '/redux-submit',
                arguments: 'Comment'
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
          CommonHeader(),
          CommonContent(),
          _buildComments(),
        ],
      )
    );
  }

  Widget _buildComments() {

    return ListView.separated(
      shrinkWrap: true, 
      itemCount: 2,
      itemBuilder: (context, int index) {
        return CommentItem();
      },
      separatorBuilder: (context, int index) => Divider(
        height: .5,
        color: Colors.black38
      ),
    );
  }
}