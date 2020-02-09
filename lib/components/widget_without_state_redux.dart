import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class WithoutStateReduxWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print(context);
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 30.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black26),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Without State Redux Version',
            style: TextStyle(
              fontSize: 24.0
            ),
          ),
          Expanded(
            child: Center(
              child: StoreConnector<int, int>(
                converter: (store) => store.state,
                builder: (context, count) => Text(
                  'count: $count',
                  style: TextStyle(
                    fontSize: 24.0
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}