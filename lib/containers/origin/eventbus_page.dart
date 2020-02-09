import 'package:flutter/material.dart';
import 'package:state_management2/components/widget_with_state_event.dart';
import 'package:state_management2/components/widget_without_state_event.dart';

class EventBusPage extends StatefulWidget {

  @override
  _EventBusPageState createState() => _EventBusPageState();

}

class _EventBusPageState extends State<EventBusPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Bus'),
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
          WithStateEventWidget(),
          WithoutStateEventWidget()
        ],
      ),
    );
  }

}
