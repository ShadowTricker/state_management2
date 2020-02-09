import 'package:flutter/material.dart';
import 'package:state_management2/components/widget_with_state.dart';
import 'package:state_management2/components/widget_without_state.dart';

class StateImprovementPage extends StatefulWidget {

  @override
  _StateImprovementPageState createState() => _StateImprovementPageState();

}

class _StateImprovementPageState extends State<StateImprovementPage> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Improvement'),
        centerTitle: true,
      ),
      body: _buildBody()
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'SuperCount: $count',
            style: TextStyle(
              fontSize: 16.0
            ),
          ),
          WithStateWidget(getCount: getCount),
          WithoutStateWidget(count)
        ],
      ),
    );
  }

  void getCount(int count) {
    setState(() {
      this.count = count;
    });
  }

}