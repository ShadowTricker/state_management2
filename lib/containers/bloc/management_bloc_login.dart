
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management2/components/demo_component/flutter_logo.dart';
import 'package:state_management2/containers/bloc/events/author_event.dart';

import 'bloc_models/author_bloc.dart';

class ManagementBlocLoginPage extends StatelessWidget {

  final TextEditingController _loginTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context)
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildLoginArea(context)
      ],
    );
  }

  Widget _buildLoginArea(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          FlutterLogoWidget(),
          userNameInput(),
          buttonArea(context)
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

  Widget buttonArea(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 131.0, vertical: 12.0),
        child: Text('Login', style: TextStyle(
          color: Colors.white,
          fontSize: 20.0
        )),
        onPressed: () {
          print(_loginTextController.text);
          BlocProvider.of<AuthorBloc>(context).add(AuthorEvent(author: _loginTextController.text));
          Navigator.of(context).pushReplacementNamed('/bloc-articles');
        },
        color: Colors.blue,
      ),
    );
  }

}