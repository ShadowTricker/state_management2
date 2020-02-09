import 'package:flutter/material.dart';
import 'package:state_management2/components/widget_with_state.dart';
import 'package:state_management2/components/widget_without_state.dart';

class StateAndPropsPage extends StatefulWidget {

  @override
  _StateAndPropsState createState() => _StateAndPropsState();

}

class _StateAndPropsState extends State<StateAndPropsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State & Props'),
        centerTitle: true,
      ),
      body: _buildBody()
    );
  }

  Widget _buildBody() {
    print(context);
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          WithStateWidget(),
          WithoutStateWidget(3)
        ],
      ),
    );
  }

}

