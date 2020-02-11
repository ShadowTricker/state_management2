import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_management2/constant/counter_event.dart';

class WithStateReduxWidget extends StatefulWidget {

  @override
  _WithStateReduxWidgetState createState() => _WithStateReduxWidgetState();

}

class _WithStateReduxWidgetState extends State<WithStateReduxWidget> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    print(context);
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[
          Text(
            'Widget With State',
            style: TextStyle(
              fontSize: 24.0
            )
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                StoreConnector<int, VoidCallback>(
                  converter: (store) => () => store.dispatch(CounterEvent.increment),
                  builder: (context, callback) => _buildButton(
                    buttonColor: Colors.blue,
                    fontColor: Colors.white,
                    icon: Icons.add,
                    onPressed: callback
                  ),
                ),
                StoreConnector<int, VoidCallback>(
                  converter: (store) => () => store.dispatch(CounterEvent.decrement),
                  builder: (context, callback) => _buildButton(
                    buttonColor: Colors.blue,
                    fontColor: Colors.white,
                    icon: Icons.remove,
                    onPressed: callback
                  ),
                ),
                StoreConnector<int, int>(
                  converter: (store) => store.state,
                  builder: (context, count) => Text(
                    'count: $count',
                    style: TextStyle(
                      fontSize: 24.0
                    )
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black26),
      ),
    );
  }

  Widget _buildButton({ Color buttonColor, Color fontColor, icon, onPressed }) {
    return Ink(
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
        color: fontColor,
      ),
      decoration: ShapeDecoration(
        color: Colors.lightBlue,
        shape: CircleBorder(),
      ),
    );
  }

}