
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_management2/components/demo_component/flutter_logo.dart';
import 'package:state_management2/containers/redux/actions/set_author.dart';
import 'package:state_management2/containers/redux/store/app_state.dart';
import 'package:state_management2/services/http_service.dart';

import 'actions/fetch_articles.dart';
import 'models/article_model.dart';
import 'models/comment_model.dart';

class ManagementReduxLoginPage extends StatefulWidget {

  @override
  _ManagementReduxLoginPageState createState() => _ManagementReduxLoginPageState();

}

class _ManagementReduxLoginPageState extends State<ManagementReduxLoginPage> {

  TextEditingController _loginTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildLoginArea()
      ],
    );
  }

  Widget _buildLoginArea() {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          FlutterLogoWidget(),
          userNameInput(),
          buttonArea()
        ],
      ),
    );
  }

  Widget userNameInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
      child: TextField(
        controller: _loginTextController,
        autofocus: false,
        decoration: InputDecoration(
          labelText: 'Username or Email',
          hintText: 'Input username'
        )
      ),
    );
  }

  /* Widget buttonArea() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 131.0, vertical: 12.0),
        child: Text('Login', style: TextStyle(
          color: Colors.white,
          fontSize: 20.0
        )),
        onPressed: () async {
          print(_loginTextController.text);
          final List<Article> articles = await HttpService.getArticles();
          final List<Comment> comments = await HttpService.getComments(1);
          print(comments);
          Navigator.of(context).pushReplacementNamed('/redux-articles', arguments: articles);
        },
        color: Colors.blue,
      ),
    );
  } */

  Widget buttonArea() {
    return StoreConnector<AppState, VoidCallback>(
      converter: (store) {
        return () {
          store.dispatch(getArticles());
          store.dispatch(SetAuthorAction(_loginTextController.text));
        };
      },
      builder: (context, callback) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 131.0, vertical: 12.0),
            child: Text('Login', style: TextStyle(
              color: Colors.white,
              fontSize: 20.0
            )),
            onPressed: () {
              callback();
              Navigator.of(context).pushReplacementNamed('/redux-articles');
            },
            color: Colors.blue,
          ),
        );
      },
    );
  }

}