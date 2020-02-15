
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_management2/components/demo_component/flutter_logo.dart';
import 'package:state_management2/containers/redux/actions/set_author.dart';
import 'package:state_management2/containers/redux/store/app_state.dart';

class ManagementReduxLoginPage extends StatelessWidget {

  final TextEditingController _loginTextController = TextEditingController();

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

  Widget buttonArea() {
    return StoreConnector<AppState, VoidCallback>(
      converter: (store) => () => store.dispatch(SetAuthorAction(_loginTextController.text)),
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