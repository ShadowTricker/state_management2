import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_management2/components/widget_with_state_redux.dart';
import 'package:state_management2/components/widget_without_state_redux.dart';
import 'package:state_management2/models/redux_dart/count_redux_model.dart';

class ReduxPage extends StatefulWidget {

  final String title;

  ReduxPage({ @required this.title });

  @override
  _ReduxPageState createState() => _ReduxPageState();

}

class _ReduxPageState extends State<ReduxPage> {

  final Store store = Store<int>(couterReducer, initialState: 0);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: store,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title
          ),
        ),
        body: _buildBody()
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          StoreConnector<int, int>(
            converter: (store) => store.state,
            builder: (context, count) => Text(
              'SuperCount: $count',
              style: TextStyle(
                fontSize: 16.0
              ),
            ),
          ),
          WithStateReduxWidget(),
          WithoutStateReduxWidget()
        ],
      ),
    );
  }

}