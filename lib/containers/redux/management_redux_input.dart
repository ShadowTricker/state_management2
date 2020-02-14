import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_management2/containers/redux/actions/add_article.dart';
import 'package:state_management2/containers/redux/actions/add_comment.dart';
import 'package:state_management2/containers/redux/store/app_state.dart';
import 'package:state_management2/services/http_service.dart';

class ManagementReduxInputPage extends StatefulWidget {

  final Map<String, dynamic> arguments;

  ManagementReduxInputPage({ @required this.arguments });

  @override
  _ManagementReduxInputPageState createState() => _ManagementReduxInputPageState();

}

class _ManagementReduxInputPageState extends State<ManagementReduxInputPage> {

  TextEditingController _itemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add ${ widget.arguments['pageType'] }',
        ),
        centerTitle: true,
      ),
      body: _buildBody()
    );
  }

  Widget _buildBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          commentInput(),
          buttonArea()
        ],
      ),
    );
  }

  Widget commentInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Form(
        autovalidate: true,
        child: TextFormField(
          controller: _itemController,
          autofocus: false,
          maxLines: 8,
          maxLength: widget.arguments['pageType'] == 'Article' ? 1000 : 100,
          maxLengthEnforced: true,
          decoration: InputDecoration(
            hintText: 'Input your ${ widget.arguments['pageType'].toLowerCase() }',
          ),
          validator: (v) {
            if (v.trim().isEmpty) {
              return 'Empty';
            }
            return null;
          }
        ),
      )
    );
  }

  Widget buttonArea() {
    return StoreConnector<AppState, Store<AppState>>(
      converter: (store) => store,
      builder: (context, store) {
        return Container(
          width: double.infinity,
          height: 52.0,
          child: InkWell(
            child: Center(
              child: Text('Submit', style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
              )),
            ),
            onTap: () {
              final Map<String, dynamic> newItem = {
                'author': store.state.author,
                'content': _itemController.text,
                if (widget.arguments['pageType'] == 'Article') 'title': '临时添加',
                if (widget.arguments['pageType'] == 'Comment') 'articleId': widget.arguments['articleId']
              };
              /* bool isSuccess = false;
              if (widget.arguments['pageType'] == 'Article') {
                isSuccess = await HttpService.addArticle(newItem);
              }
              else {
                isSuccess = await HttpService.addComment(newItem);
              }
              if(isSuccess) {
                Navigator.of(context).pop();
              }  */
              if (widget.arguments['pageType'] == 'Article') {
                store.dispatch(addArticle(newItem));
              }
              else {
                store.dispatch(addComment(newItem, widget.arguments['articleId']));
              }

              Navigator.of(context).pop(true);
            },
          ),
          decoration: BoxDecoration(
            color: Colors.blue
          ),
        );
      },
    );
  }

}